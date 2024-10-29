import { useEffect, useState } from "react";

const OrderTable = ({ orders }) => {
  const [sortedOrders, setSortedOrders] = useState([]);
  const [sortConfig, setSortConfig] = useState({
    key: "",
    direction: "",
  });

  useEffect(() => {
    setSortedOrders(orders)
  }, [orders])

  const requestSort = (key) => {
    let direction = "ascending";
    if (sortConfig.key === key && sortConfig.direction === "ascending") {
      direction = "descending";
    }
    setSortConfig({ key, direction });
    sortData(key, direction);
  };


  const sortData = (key, direction) => {
    const sortedData = [...sortedOrders];
    sortedData.sort((a, b) => {
      if (a[key] < b[key]) {
        return direction === "ascending" ? -1 : 1;
      }
      if (a[key] > b[key]) {
        return direction === "ascending" ? 1 : -1;
      }
      return 0;
    });
    setSortedOrders(sortedData);
  };

  return (
    <table className="table orders-table">
      <thead>
        <tr>
          <SortableHeader
            label="Order #"
            sortKey="id"
            sortConfig={sortConfig}
            requestSort={requestSort}
          />
          <SortableHeader
            label="Ordered at"
            sortKey="created_at"
            sortConfig={sortConfig}
            requestSort={requestSort}
          />
          <SortableHeader
            label="Pick up at"
            sortKey="pick_up_at"
            sortConfig={sortConfig}
            requestSort={requestSort}
          />
          <SortableHeader
            label="Customer Name"
            sortKey="customer_name"
            sortConfig={sortConfig}
            requestSort={requestSort}
          />
          <th>Item</th>
          <th>Qty</th>
          <th>Status</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>

        {sortedOrders.map((order) => (
          <OrderRow order={order} key={order.id}/>
        ))}
      </tbody>
    </table>
  );
};

const SortableHeader = ({ label, sortKey, sortConfig, requestSort }) => {
  const isSorting = sortConfig.key === sortKey;
  const direction = isSorting ? sortConfig.direction : "ascending";

  return (
    <th onClick={() => requestSort(sortKey)}>
      {label}{" "}
      {isSorting && (
        <span>{direction === "ascending" ? "▲" : "▼"}</span>
      )}
    </th>
  );
};

const OrderRow = ({ order }) => {
  const [status, setStatus] = useState(order.fulfilled)
  const fullFillOrder = async (order_id) => {
    const response = await fetch(`/api/orders/${order_id}`, {
      method: "PATCH"
    })
    setStatus(response.status == 200 ? true : false)
  }

  return (
    <tr>
      <td>{order.id}</td>
      <td>{formatDate(order.created_at)}</td>
      <td>{formatDate(order.pick_up_at)}</td>
      <td>{order.customer_name}</td>
      <td>{order.item}</td>
      <td>{order.quantity}</td>
      <td>{status ? `Fulfilled` : `In progress`}</td>
      <td>
        {order.fulfilled ? "" :

          <button disabled={status} onClick={() => fullFillOrder(order.id)
          }>FulFill</button>}</td>
    </tr>
  );
};

const formatDate = (dateString) => {
  let date = new Date(dateString);
  return date.toLocaleDateString();
};

export default OrderTable;
