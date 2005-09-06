From: Tom Vier <tmv@comcast.net>
Subject: Re: journal size reiserfs vs reiser4
Date: Tue, 6 Sep 2005 09:59:51 -0400
Message-ID: <20050906135951.GA12333@zero>
References: <4317FD1B.504@namesys.com> <Pine.GSO.4.44L.0509021620380.23379-100000@unix2.cc.ksu.edu> <b14e81f005090318046ee67d7e@mail.gmail.com> <431A5E43.4060005@slaphack.com> <431A6E71.4060105@namesys.com>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-25876-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <431A6E71.4060105@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: Hans Reiser <reiser@namesys.com>

On Sat, Sep 03, 2005 at 08:48:01PM -0700, Hans Reiser wrote:
> This is a bit arrogant, but I believe that a user that does not know how
> to recompile the kernel with the #define changed is not sophisticated

I think it's pretty inconvenient to have to change that and rebuild the
kernel (possibly voiding a vendor's warrenty) just to change the reserve %.
ext2/3 has always had it tunable. As long as a reasonable % is chosen, few
will bother to change it. What if your file server is almost full, but you
can't get funding for more drives for a couple months? You have to rebuild
your kernel if you just want to use another 2%?

Rebuilding a kernel is no big deal for me, but it is for others, and not
just because of lack of ability. I'm sure there are situations where you
can't just plop in a new kernel (company security policies, support
contracts, etc), no matter how easy it is to build.


My vote: put the reserve % in the superblock (if it isn't already) and
give mkfs a sane default.

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0x15741ECE
