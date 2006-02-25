From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: creating live virtual files by concatenation
Date: Sat, 25 Feb 2006 16:30:38 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0602251629560.13355@yvahk01.tjqt.qr>
References: <1271316508.20060225153749@dns.toxicfilms.tv>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28124-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1271316508.20060225153749@dns.toxicfilms.tv>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maciej Soltysiak <solt2@dns.toxicfilms.tv>
Cc: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

>
>Now let us say I am creating sort of a virtual text file (code.js)
>that is a live-concatenation of these files:
># concatenate tooltip.js banner.js foo.js code.js
>
>Note I am not talking about the cat(1) utility. I am thinking of
>code.js be always a live concatenated version of these three, so when
>I modify one file, the live-version is also modified.
>
>What puprose I might have? Network-related. Say, I have an HTML file
>that includes these three files in its code.
>
Try FUSE.

>If I had a live-concatenated file, I could reference it in the HTML file
>so that the browser does not have to download three files but just one.
>
>This would surely reduce network overhead of downloading the same amount
>of data but within just one connection, reduce resource usage on the client
>and possibly (depending on implementation) reduce the cost of accessing
>three individual files on the server.
>
Have you ever heard of persistent connections with HTTP/1.1?


Jan Engelhardt
-- 
