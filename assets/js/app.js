
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
          position: absolute;
          left: 85%;
          top: 50%;
          -webkit-transform: translate(-85%, -50%);
          transform: translate(-85%, -50%);      
        }
      </style>
      <iframe id="app-container" src="https://www.youtube.com/embed/jATox3OCefw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>        `;
    }
}

customElements.define('flutter-app', FlutterApp);