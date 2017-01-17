# Brunch Example

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Configuring Brunch

Brunch is very simple; it is a pure asset builder - it takes static JS/CSS/etc,
and spits out compiled/transpiled versions into a specified folder. That's it.

For reference, it is worth reading the [Phoenix Guides page on static assets](http://www.phoenixframework.org/docs/static-assets), which explains how
Brunch is used with Phoenix. In Phoenix' case, Brunch looks in the `web/static`
folder, and compiles it to `priv/`, where the resultant files are made available
from the front end.

The [Brunch quickstart guide](http://brunch.io/docs/getting-started) is useful:
it is worth making a basic test project using that, just to see how it works.
There is also an [exhaustive community-written guide](https://github.com/brunch/brunch-guide)
which goes into a fair amount of detail.

---

In theory, this step should be _almost_ zero-config. Functionality in Brunch is
added via plugins; generally this is just a case of installing a plugin;
most of the time that's it, it should _just work_.

But sometimes a modification to `brunch-config.js` is necessary. To compare with
Rails' asset pipeline, most of the time you just put the _stuff_ in the required
places, but at times you may need to make changes inside the `config` folder, e.g.
modifying `config/initializers/assets.rb` to change how Rails deals with certain
filetypes.

For this example project, I am assuming that Rails-like functionality is wanted,
so automatic compilation of CoffeeScript for the scripts, and automatic compilation
of Scss for the styles. I am also including a JS library globally (JQuery).

### Preparation

[Node must be installed](https://nodejs.org/en/). With Brunch, you will install
JS dependencies via NPM (the Node Package Manager). NPM dependencies (an config)
is handled via the `package.json` file in the root of the project. Additional
Brunch-specific config can be added to `brunch-config.js`.

### Scss

By default, Phoenix includes the `brunch-css` plugin, which is set up to take
everything in `static/css`, concatenate it together, and spit it out as `app.css`
in the `priv/static.css` directory. But you'd like to have variables and mixins
and functions, so you want that Sass goodness.

This step is simple - just install the `sass-brunch` plugin by running
(in the root of the project):

```
npm install sass-brunch --save-dev
```

This will save it to `package.json` as a development dependency. Brunch automatically
uses installed Brunch plugin dependencies, so you should now be able to author
styles in `web/static/css` as `.scss` rather than `.css`.

> **NOTE** I have had a few issues with this plugin - sometimes it ends up
with the project just hanging, either on install, or when trying to run Phoenix.
If this happens, manually delete the `node_modules/` folder in the project, and
just run `npm install` again to rebuild it.


You can test that everything is working by:

1. converting `app.css` and `phoenix.css` to `app.scss` and `phoenix.scss` respectively.
2. running `mix phoenix.server`

Everything should look exactly the same as it did beforehand - Brunch will have
compiled the Scss files to `priv/static/css/app.css`.

You can add more Scss files in the `web/static/css` folder, and use them as normal.

To demonstate `@import` and Sass variables functioning, create a file called
`test.scss`, and at the top of `app.scss`, add

```
@import "test";
```

The import isn't strictly necessary - Brunch will just go ahead and compile your
Scss files to CSS and put them all together, but explicitly importing means you
can define what order they appear. The main `app` stylesheet is the last thing to
be concatenated, so anything there will appear at the end of the final stylesheet.

In `test`, add:

```
$disgusting-green: #56FF00;
$bluescreen-o-death: #0010FF;
$baby-poo: #6A7E25;
$awful-pink: #FF00EF;
$normal-poo: #806E28;

body {
  background-color: $bluescreen-o-death;
  color: $awful-pink;
  font-family: "Comic Sans", "Chalkboard", "Impact", monospaced;
}

.jumbotron {
  background-color: $baby-poo;
  font-family: "Papyrus", fantasy;
}

.main {
  background-color: $disgusting-green;
  color: $normal-poo;
}
```

The live reload should kick in once you save, giving you a far superior colour
scheme:

![New colour scheme for Phoenix](./sass.png)




**Go to the `step3/configuring_coffeescript` branch for the next step →**
