From: "Clemens Eisserer" <linuxhippy@gmail.com>
Subject: Re: Which version will be merged into mainline kernel?
Date: Thu, 2 Nov 2006 10:09:20 +0100
Message-ID: <194f62550611020109x7733dff0ic475414afbf783af@mail.gmail.com>
References: <194f62550610160250u265ef120lee3cf9a17266939f@mail.gmail.com>
	 <4533D788.3000406@namesys.com>
	 <194f62550611010524t6d2b9e40n422e63de1e9a48b1@mail.gmail.com>
	 <45495858.6020507@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30092-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <45495858.6020507@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hello,

> ok, a bit later
No need to hurry ;)

> both compressed and decompressed data are cached, it means that
> cryptcompress file requires  *(2-R) more memory then usual file
> (R - compression ratio)
Oh ... thats a drawback. It means the performance advantage
compression will do will be destroyed at least partially :-/ However I
am sure there are fine reasons to do so (or the current VFS design
forces to do so) and I also don't understand the background.
I am happy with what I get :-)

> What is hardware configuration of your laptop?
Its a Northwood-P4-2.6ghz with a very slow (Hitachy?) drive:
 "Timing buffered disk reads:   48 MB in  3.08 seconds =  15.59 MB/sec"

Thanks a lot for this great FS, lg Clemens

Btw. If you send me the setup - this could be seen as support service ;)
Would it help Reiser4 development if I pay the 25$ - or is the locked?
