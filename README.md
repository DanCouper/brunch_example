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

**Go to the v2 branch for the next step →**
