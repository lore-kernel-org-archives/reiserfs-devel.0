From: "Yura Umanets" <umanets@priocom.com>
Subject: Re: mkreiserfs -q
Date: Tue, 02 Apr 2002 16:48:07 +0300
Message-ID: <3CA9B697.4030902@priocom.com>
References: <E16sOPz-0005lr-00@gull.prod.itd.earthlink.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Randy Hron <rwhron@earthlink.net>
Cc: reiserfs-list@namesys.com

Randy Hron wrote:

>Sometimes I have to create a reiserfs filesystem over a dialup
>or serial connection.   mkreiserfs on a large filesystem prints
>almost 1 meg of output.  I work around this by redirecting
>mkreiserfs output to a file.  
>
>The -q option in reiserfsck has been a huge timesaver when
>on serial line.  On a serial/dialup line, -q means both quick and quiet.
>
>It would be nice to see a -q option for mkreiserfs too. :)
>
>
>
>
>
You should be using a command:

echo "Yes" | mkreiserfs ...

-- 
Yury Umanets
IT Engineer of Priocom Corp.
Phone: +380 44 2011959, ICQ: 55494590



