From: Russell Coker <bofh@coker.com.au>
Subject: Re: Raid5, LVM and Reiserfs
Date: Mon, 21 Oct 2002 11:44:17 +0200
Message-ID: <200210211144.17907.bofh@coker.com.au>
References: <000701c277c9$ef8d6c70$0101a8c0@bummer> <200210210751.39155.bofh@coker.com.au> <3DB398FD.6000205@namesys.com>
Reply-To: Russell Coker <bofh@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11731-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DB398FD.6000205@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Valdis.Kletnieks@vt.edu, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

On Mon, 21 Oct 2002 08:04, Hans Reiser wrote:
> >It's fairly common for low-end RAID hardware to have limitations of memory
> > or CPU bandwidth that limit the bulk IO rate.  Hardware RAID that can
> > only sustain 10M/s was quite common until very recently.
>
> Wow.   I guess marketing folks figured out that most customers would not
> measure it.  10M/s would be amazingly useless as a controller.

Depends what you are doing.  When running dpkg to install new dpkg such a 
controller performed very well.  Running Bonnie++ gave results that sucked 
badly.

I didn't get a chance to do any real-world performance tests because the 
client went bankrupt too soon.

-- 
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page

