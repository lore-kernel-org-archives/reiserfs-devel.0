From: Marco Gatti <marco.gatti@gmail.com>
Subject: Re: reiserfs + acl corruption
Date: Tue, 6 Apr 2010 15:31:56 +0200
Message-ID: <y2s54cce25c1004060631l918b128bi32c2739bc68aa271@mail.gmail.com>
References: <54cce25c1003280829q2a173c91p55bc3297a3163452@mail.gmail.com>
	 <alpine.DEB.2.01.1004041324340.29272@bogon.housecafe.de>
	 <alpine.DEB.2.01.1004041755070.29272@bogon.housecafe.de>
	 <alpine.DEB.2.01.1004042240500.29272@bogon.housecafe.de>
	 <4BBA0313.4020405@suse.com>
	 <alpine.DEB.2.01.1004060136060.29272@bogon.housecafe.de>
	 <r2r54cce25c1004060240o8f8baf09y5ccb5d7c6791ef53@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:received:message-id:subject:from:to:content-type;
        bh=62F56iiqcIukN3kC5gmVY3PX0xaudz5CFBSKX/cav7c=;
        b=CGeOUHuCv9Ci7SYhQvV4MX5VHCJXlniTVyU9g5G8Sh8lwtWXhsx2ohIcpE6bpkc2wC
         7noOaHzMyFPQyvYczAtiWkDTQtTxHhywWDH2BvRst/xyEzOzWrxLzw73lGChDJZo1uxP
         iFh0FcgM4eobAGZUBLmGrMIV+uHTZTkP88voY=
In-Reply-To: <r2r54cce25c1004060240o8f8baf09y5ccb5d7c6791ef53@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

Ok, i made some tests and i think i found something really relevant.
I tested in 2 different machines various kernel versions, this is my report:

2.6.26 debian flavoured - no bug
2.6.29.6 - no bug
2.6.30.9 - acl bug present
2.6.31.12 - acl bug present
2.6.32.8, 2.6.32.9, 2.6.32.10 - acl bug present

Then the really interesting thing. If you try my test


mkfsreiserfs /dev/sdc1
mount -o acl /dev/sdc1 /mnt
cd /mnt
mkdir dir_with_many_files
touch dir_with_many_files/{1..100000}
setfacl -R -m u:username:rw dir_with_many_files
setfacl -R -x u:username dir_with_many_files
setfacl -R -b dir_with_many_files


when using the setfacl command keep an eye on the space occupation on
the partition/disc you are testing.
With kernels with bug present when issuing "setfacl -R -x ..." the
used space get reduced like there is no acl at all (or a kind of).
Let's make it clear:
- after creating 300000 empty files in a directory i have 60MB of space used;
- after "setfacl -R -m ..." i have 1.3GB of space used;
- after "setfacl -R -x ..." with bugged kernels i have 153MB of space used;
- after "setfacl -R -x ..." with NO bugged kernels i still have 1.3GB
of space used;
- after "setfacl -R -b ..." with NO bugged kernels i have 119MB of space used.

It seems to me that the changes introduced in kernel version 2.6.30
have modified heavily the behaviour in handling extended attributes,
but i'm not a kernel hacker then i'll leave you looking through the
code!
Hope this helps and if you have some patch (i hope against 2.6.32)
i'll be glad to test it.

Cheers
Marco
