"use strict";
exports.__esModule = true;
var image_1 = require("next/image");
var page_module_css_1 = require("./page.module.css");
function Home() {
    return (React.createElement("main", { className: page_module_css_1["default"].main },
        React.createElement("div", { className: page_module_css_1["default"].description },
            React.createElement("p", null, "This is a test by David"),
            React.createElement("div", null,
                React.createElement("a", { href: "https://vercel.com?utm_source=create-next-app&utm_medium=appdir-template&utm_campaign=create-next-app", target: "_blank", rel: "noopener noreferrer" },
                    "By ",
                    React.createElement(image_1["default"], { src: "/vercel.svg", alt: "Vercel Logo", className: page_module_css_1["default"].vercelLogo, width: 100, height: 24, priority: true })))),
        React.createElement("div", { className: page_module_css_1["default"].center },
            React.createElement(image_1["default"], { className: page_module_css_1["default"].logo, src: "/next.svg", alt: "Next.js Logo", width: 180, height: 37, priority: true })),
        React.createElement("div", { className: page_module_css_1["default"].grid },
            React.createElement("a", { href: "https://nextjs.org/docs?utm_source=create-next-app&utm_medium=appdir-template&utm_campaign=create-next-app", className: page_module_css_1["default"].card, target: "_blank", rel: "noopener noreferrer" },
                React.createElement("h2", null,
                    "Docs ",
                    React.createElement("span", null, "->")),
                React.createElement("p", null, "Find in-depth information about Next.js features and API.")),
            React.createElement("a", { href: "https://nextjs.org/learn?utm_source=create-next-app&utm_medium=appdir-template&utm_campaign=create-next-app", className: page_module_css_1["default"].card, target: "_blank", rel: "noopener noreferrer" },
                React.createElement("h2", null,
                    "Learn ",
                    React.createElement("span", null, "->")),
                React.createElement("p", null, "Learn about Next.js in an interactive course with\u00A0quizzes!")),
            React.createElement("a", { href: "https://vercel.com/templates?framework=next.js&utm_source=create-next-app&utm_medium=appdir-template&utm_campaign=create-next-app", className: page_module_css_1["default"].card, target: "_blank", rel: "noopener noreferrer" },
                React.createElement("h2", null,
                    "Templates ",
                    React.createElement("span", null, "->")),
                React.createElement("p", null, "Explore the Next.js 13 playground.")),
            React.createElement("a", { href: "https://vercel.com/new?utm_source=create-next-app&utm_medium=appdir-template&utm_campaign=create-next-app", className: page_module_css_1["default"].card, target: "_blank", rel: "noopener noreferrer" },
                React.createElement("h2", null,
                    "Deploy ",
                    React.createElement("span", null, "->")),
                React.createElement("p", null, "Instantly deploy your Next.js site to a shareable URL with Vercel.")))));
}
exports["default"] = Home;

//# sourceMappingURL=page.js.map
