import { useEffect, useState } from "react";
import { createRoot } from "react-dom/client";
import { ClipLoader } from "react-spinners";

import Orders from "/app/components/orders";

const element = document.querySelector("[data-order-table]");

const App = () => {
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    // Simulate data fetching delay
    setTimeout(() => {
      setLoading(false);
    }, 2000); // Adjust the delay as needed

    // You can include any other initialization code here
  }, []);

  return (
    <>
      {loading ? (
        <div className="loader-container">

          <div className="loader">
            <ClipLoader
              color="#00BFFF" // Set the color
              size={200} // Set the size
            />
          </div>
        </div>
      ) : (
        <Orders />
      )}
    </>


  );
};

if (element) {
  createRoot(element).render(<App />);
}
