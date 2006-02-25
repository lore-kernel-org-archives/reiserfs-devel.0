From: Maciej Soltysiak <solt2@dns.toxicfilms.tv>
Subject: creating live virtual files by concatenation
Date: Sat, 25 Feb 2006 15:37:49 +0100
Message-ID: <1271316508.20060225153749@dns.toxicfilms.tv>
Reply-To: Maciej Soltysiak <solt2@dns.toxicfilms.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28122-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: reiserfs-list@namesys.com

Hello!

I have this idea about creating sort of a virtual file.

Let us say I have three text files that contain javascript code:
tooltip.js
banner.js
foo.js

Now let us say I am creating sort of a virtual text file (code.js)
that is a live-concatenation of these files:
# concatenate tooltip.js banner.js foo.js code.js

Note I am not talking about the cat(1) utility. I am thinking of
code.js be always a live concatenated version of these three, so when
I modify one file, the live-version is also modified.

What puprose I might have? Network-related. Say, I have an HTML file
that includes these three files in its code.

When a browser downloads the HTML file it will then create three threads
to download each of those javascript files.

If I had a live-concatenated file, I could reference it in the HTML file
so that the browser does not have to download three files but just one.

This would surely reduce network overhead of downloading the same amount
of data but within just one connection, reduce resource usage on the client
and possibly (depending on implementation) reduce the cost of accessing
three individual files on the server.

I am CC'ing reiserfs-list because Reiser4 would seem to be the most
robust filesystem that could have it done.

Any thoughts about the idea itself?
Would be nice if this idea could inspire some talented hackers here and there.

Best Regards,
Maciej


