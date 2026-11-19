// GitHub Pages has no SPA fallback: copy index.html to each client route
// (so deep links return 200) and to 404.html (catch-all), and disable Jekyll.
const fs = require("fs");
const path = require("path");

const build = path.join(__dirname, "..", "frontend", "build");
const index = path.join(build, "index.html");
const routes = ["about", "project", "resume"];

for (const route of routes) {
  fs.mkdirSync(path.join(build, route), { recursive: true });
  fs.copyFileSync(index, path.join(build, route, "index.html"));
}
fs.copyFileSync(index, path.join(build, "404.html"));
fs.writeFileSync(path.join(build, ".nojekyll"), "");
console.log(`postbuild: copied index.html to ${routes.join(", ")}, 404.html; wrote .nojekyll`);
