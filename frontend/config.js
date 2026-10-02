window.AUTOFLOW_CONFIG = {
  JAVA_API_URL: location.hostname.includes("onrender.com")
    ? "https://onboardflow-java-api.onrender.com"
    : "http://localhost:8080",
  PYTHON_API_URL: location.hostname.includes("onrender.com")
    ? "https://onboardflow-python-service.onrender.com"
    : "http://localhost:8001"
};
