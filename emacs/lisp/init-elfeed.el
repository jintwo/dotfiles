;;; init-elfeed.el --- elfeed config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package elfeed
  :defer t)

(setq elfeed-feeds
      '(;; sound/music
        ("https://feeds.feedburner.com/SonicstatecomNews" sound news)
        ("http://admiralbumblebee.com/feed.xml" sound news mixing)
        ("http://www.synthtopia.com/feed/" sound news synth)
        ("http://designingsound.org/feed/" sound news)
        ("http://www.factmag.com/feed/" sound news music)
        ("http://www.attackmagazine.com/feed/" sound news music)
        ("http://www.soundesign.info/feed" sound news)
        ("http://www.synthanatomy.com/feeds/posts/default" sound news synth)
        ("http://feeds.feedburner.com/createdigitalmusic" sound news synth music)
        ("https://www.kvraudio.com/rss/kvr_news_top.rss" sound news synth)
        ;; music/releases
        ("http://post-trash.com/news?format=RSS" music releases)
        ("http://slowdivescorner.blogspot.com/feeds/posts/default" music releases)
        ("https://www.rarelyunable.com/feed/" music releases)
        ("http://fuckedbynoise.blogspot.com/feeds/posts/default?alt=rss" music releases)
        ("https://theanswerisinthebeat.net/feed/" music releases)
        ("http://thequietus.com/feed" music news releases)
        ("https://sadwave.com/feed/" music releases)
        ;; dev
        ("http://lucumr.pocoo.org/feed.atom" dev)
        ("https://tylerxhobbs.com/essays?format=rss" dev)
        ("http://feeds.feedburner.com/OfficialDBlog" dev dlang)
        ("http://nullprogram.com/feed/" dev)
        ("http://eli.thegreenplace.net/feed/" dev)
        ("http://mccormick.cx/news/index.rss" dev)
        ("http://theorangeduck.com/feeds/pages" dev gamedev blog)
        ("http://nikhilism.com/index.xml" dev)
        ("http://www.theerlangelist.com/feeds/posts/default" dev erlang)
        ("http://feeds.feedburner.com/sachac" dev lisp emacs)
        ("http://blog.demofox.org/feed/" dev)
        ("https://atsushieno.github.io/feed.xml" dev audio)
        ("https://www.masteringemacs.org/feed" dev lisp emacs)
        ("https://scripter.co/posts/atom.xml" dev lisp emacs)
        ("http://wasmweekly.news/feed.xml" dev wasm)
        ("http://planet.lisp.org/rss20.xml" dev lisp)
        ("http://alan.petitepomme.net/cwn/cwn.rss" dev)
        ("http://jvns.ca/atom.xml" dev blog)
        ("http://pointersgonewild.com/feed/" dev blog)
        ("http://feeds.feedburner.com/CestLaZ" dev blog)
        ("https://zigmonthly.org/index.xml" dev zig)
        ("http://www.scheme.dk/planet/atom.xml" dev lisp scheme)
        ("http://planet.ocamlcore.org/atom.xml" dev ocaml)
        ("http://irreal.org/blog/?feed=rss2" dev blog)
        ("https://cdn.jwz.org/blog/feed/" blog) ;; uncategorized
        ("http://scattered-thoughts.net/atom.xml" dev)
        ("https://ianthehenry.com/feed.xml" dev)
        ("http://notes.eatonphil.com/rss.xml" dev)
        ("http://planet.clojure.in/atom.xml" dev lisp clojure)
        ("https://danluu.com/atom.xml" dev blog)
        ("https://daringfireball.net/feeds/main" dev blog)
        ("https://macowners.club/index.xml" dev macos)
        ;; dev/game
        ("https://niklasriewald.com/feed/" dev gamedev)
        ("https://verdagon.dev/rss.xml" dev gamedev lang)
        ("https://rust-gamedev.github.io/rss.xml" dev rust gamedev)
        ;; dev/rust
        ("https://blog.yoshuawuyts.com/rss.xml" dev rust)
        ("http://this-week-in-rust.org/atom.xml" dev rust)
        ;; dev/swift
        ("https://swiftbysundell.com/rss" dev swift)
        ("https://theswiftdev.com/rss.xml" dev swift)
        ("https://www.avanderlee.com/feed/" dev swift)
        ("https://desiatov.com/rss.xml" dev swift)
        ("http://www.vadimbulavin.com/feed.xml" dev swift)
        ("https://mecid.github.io/feed.xml" dev swift)
        ("http://kean.github.io/feed.xml" dev swift)
        ;; dev/hardware
        ("https://www.chipperbits.com/feeds/all.atom.xml" dev hardware)
        ;; tech news
        ("http://www.opennet.ru/opennews/opennews_all.rss" tech news)
        ("http://www.linux.org.ru/section-rss.jsp?section=1" tech news)
        ;; art?
        ("http://syg.ma/feed.atom" art)
        ("http://www.hellocatfood.com/feed/" art)
        ("https://twobithistory.org/feed.xml" art)
        ;; science
        ("http://elementy.ru/rss/news" science)
        ;; travel/blogs
        ("http://katab.asia/feed/" blog)
        ("http://perito-burrito.com/feed" travel blog)
        ;; books
        ("http://gorky.media/feed/" blog books)))

(provide 'init-elfeed)
;;; init-elfeed.el ends here
