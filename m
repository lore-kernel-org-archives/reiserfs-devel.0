From: Russell Coker <bofh@coker.com.au>
Subject: Re: what do you do that stresses your filesystem?
Date: Tue, 24 Dec 2002 13:41:54 +0100
Message-ID: <200212241341.54276.bofh@coker.com.au>
References: <3E06F360.7000708@namesys.com> <200212231421.52052.bofh@coker.com.au> <3E08284C.4020906@namesys.com>
Reply-To: Russell Coker <bofh@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-12242-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E08284C.4020906@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: ReiserFS <reiserfs-list@namesys.com>

On Tue, 24 Dec 2002 10:26, Hans Reiser wrote:
> >Also if you have a rack-mount server then it'll probably take 2 minutes or
> >more to go through the BIOS checks so FS delays will seem like nothing by
> >comparison.
>
> I mostly meant waiting for the fs to read all the binaries that get
> executed at startup, not just the journal replay time.

The time taken to read the binaries is probably about 2 seconds on one of my 
servers.  The time taken to go through the BIOS part of the booting is a 
minimum of 30s and up to 5m!

If you get a rack-mount server from any of the major vendors you can only boot 
it once a year if you want to get close to five-nines.  Reboot every 10 
months and the BIOS time alone will take you down to four-nines.

-- 
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page

