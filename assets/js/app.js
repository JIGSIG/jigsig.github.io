
class FlutterApp extends HTMLElement {
    constructor() {
        super();
        const width = this.getAttribute("width") || "100%";
        const height = this.getAttribute("height") || "100%";
        this.innerHTML = `
    <style>
        #app-container {
          height: ${height};
          width: ${width};
          margin: 0 auto;
          border: none;
        }
      </style>
    <iframe 
        id="app-container"
        src="app.html">
    </iframe>
        `;
    }
}

customElements.define('flutter-app', FlutterApp);