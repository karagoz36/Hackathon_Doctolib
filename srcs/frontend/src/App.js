import React, { useEffect, useState } from "react";

const App = () => {
  const [message, setMessage] = useState("Chargement...");

  useEffect(() => {
    fetch("http://fastapi:8000/")  // URL interne via Docker
      .then((response) => response.json())
      .then((data) => setMessage(data.message))
      .catch((error) => setMessage("Erreur de connexion"));
  }, []);

  return <h1>{message}</h1>;
};

export default App;
