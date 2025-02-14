import { useEffect, useState } from "react";

const CameraStream = () => {
  const [imageSrc, setImageSrc] = useState(null);
  const [ws, setWs] = useState(null);

  const startStream = () => {
    const socket = new WebSocket("ws://localhost:8000/ws/video");
    socket.onmessage = (event) => {
      setImageSrc(`data:image/jpeg;base64,${event.data}`);
    };
    setWs(socket);
  };

  const stopStream = () => {
    if (ws) {
      ws.close();
      setWs(null);
    }
  };

  return (
    <div>
      <button onClick={startStream}>Activer la caméra</button>
      <button onClick={stopStream}>Désactiver</button>
      {imageSrc && <img src={imageSrc} alt="Flux vidéo" />}
    </div>
  );
};

export default CameraStream;
