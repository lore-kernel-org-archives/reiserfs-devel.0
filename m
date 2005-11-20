From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe@gramoulle.com>
Subject: Re: need opinions from sysadmins on where reiser4progs should
 install
Date: Sun, 20 Nov 2005 12:55:29 +0100
Message-ID: <20051120115529.633B1177A@philou.gramoulle.local>
References: <20051120040723.GA1392@148.Red-217-126-33.pooles.rima-tde.net.>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27034-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20051120040723.GA1392@148.Red-217-126-33.pooles.rima-tde.net.>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Hello,

On Sun, 20 Nov 2005 05:07:23 +0100
rvalles <rvalles@es.gnu.org> wrote:

  | When I run make install on something and haven't specified a prefix on
  | configure, I expect /usr/local to be used. If I wanted /, I'd have
  | specified that on configure time. If it installed in / by default, it
  | would, often, hit the "sacred package-system managed area" of the VFS
  | tree annoying people like me to a very great extend, so please don't.

While i totally agree with you for standard packages, well i based my choice
on actual experience of the last past six years of use with reiserfs V3.

I can't remember how many times i heard Namesys team say " Install the latest
& greatest reiserfsck", how many times distro thought they knew reiserfsprogs
internals better than Namesys and customized it to the point where it would
eventually break.

Of course, i can live with a manual install of reiser(fs|4)progs, so i don't
really mind, but talking of support, it can make quite a difference to Namesys
in terms of support, and annoyance with bug reports that could have been easily
avoided.

Final decision will still be Namesys call, but hopefully this whole thread gave
them some valuable input to make the best decision.

Thanks,

Philippe
