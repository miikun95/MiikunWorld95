<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9">
  <xsl:output method="html" indent="yes" encoding="UTF-8" version="5" />
  <xsl:template match="/">
    <html lang="ja" xml:lang="ja" dir="ltr" prefix="og: https://ogp.me/ns#">
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="theme-color" content="#FFFFFF" />
        <meta name="color-scheme" content="only light" />
        <meta name="author" content="miikun95" />
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <meta name="twitter:card" content="summary" />
        <meta name="twitter:site" content="@miikun95" />
        <meta name="twitter:creator" content="@miikun95" />
        <meta property="og:title" content="サイトマップ｜MiikunWorld95" />
        <meta property="og:type" content="website" />
        <meta property="og:url" content="https://miikun95.net/sitemap/" />
        <meta property="og:image" content="https://miikun95.net/miikun95.png" />
        <meta property="og:locale" content="ja_JP" />
        <meta property="og:site_name" content="MiikunWorld95" />
        <link rel="manifest" href="/manifest.webmanifest" crossorigin="use-credentials" />
        <link rel="icon" href="/favicon.ico" />
        <link rel="apple-touch-icon" href="/apple-touch-icon.png" />
        <link rel="apple-touch-icon-precomposed" href="/apple-touch-icon-precomposed.png" />
        <link rel="canonical" href="https://blog.miikun95.net/feed.rss" />
        <link rel="preload" href="/style.css" as="style" />
        <link rel="stylesheet" href="/style.css" blocking="render" />
        <style nonce="<?php echo $GLOBALS['csp_nonce']; ?>">
			  	/* <![CDATA[ */
	  <?php include '/srv/www/html/includes/style.html' ?>
		      /* ]]> */
        </style>
        <title>サイトマップ｜MiikunWorld95</title>
      </head>
      <body>
        <a class="skip-link" href="#main">メインコンテンツにスキップ</a>
        <header>
          <h1 class="title">RSSフィード</h1>
          <hr />
          <div class="marquee-container">
            <div class="marquee">MiikunLog95のRSSフィードです！RSSリーダーまたは対応メールクライアント、対応ブラウザが必要です！</div>
          </div>
        </header>
        <nav>
          <ul>
            <li><a href="/" accesskey="t">トップページ</a></li>
            <li><a href="//blog.miikun95.net/" accesskey="b">ブログ</a></li>
            <li><a href="/profile/" accesskey="p">プロフィール</a></li>
            <li><a href="/download-center/" accesskey="d">ダウンロードセンター</a></li>
            <li><a href="/tools/" accesskey="u">便利ツール</a></li>
          </ul>
        </nav>
        <br />
        <hr />
        <main id="main">
          <section>
            <h2>RSSフィード</h2>  
            <dl>
              <xsl:for-each select="channel/item">
                <dt>
                  <div>ページURL</div>
                </dt>
                <dd>
                  <div>
                    <a href="{link}">    
                      <xsl:value-of select="link" />
                    </a>
                  </div>
                </dd>
                <dt>
                  <div>更新日時</div>
                </dt>
                <dd>
                  <div>
                    <xsl:call-template name="format-date">
                      <xsl:with-param name="isoDate" select="pubDate" />
                    </xsl:call-template>
                  </div>
                </dd>
                <hr />
              </xsl:for-each>
            </dl>
          </section>
        </main>
        <footer>
          <hr />
          <ul>
            <li><a href="/sitemap/">サイトマップ</a></li>
            <li><a href="/cookie-policy/">プライバシーポリシー</a></li>
            <li><a href="/terms/">利用規約</a></li>
            <li><a href="//id.miikun95.net/">MiikunWorldIDでログイン</a></li>
          </ul>
          <span>(C) 2025-2026 miikun95</span>
        </footer>
    <?php include '/srv/www/html/includes/cookie-consent.html' ?>
      </body>
    </html>
  </xsl:template>
  <xsl:template name="format-date">
    <xsl:param name="isoDate" />
    <xsl:variable name="year" select="substring($isoDate, 1, 4)" />
    <xsl:variable name="month" select="substring($isoDate, 6, 2)" />
    <xsl:variable name="day" select="substring($isoDate, 9, 2)" />
    <xsl:value-of select="concat($year, '年', $month, '月', $day, '日 ')" />
  </xsl:template>
</xsl:stylesheet>

