From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Subject: Re: online fsck
Date: Fri, 27 May 2005 11:17:25 +0200
Message-ID: <20050527091725.E7CC5BF6@philou.gramoulle.local>
References: <263a8b350505231124758be936@mail.gmail.com>
	<42930542.1000407@namesys.com>
	<4293B817.5030906@accessplus.com.au>
	<263a8b35050524200220eff78b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24172-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <263a8b35050524200220eff78b@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Hello,

On Tue, 24 May 2005 22:02:20 -0500
btinsley <btinsley@gmail.com> wrote:

  | What i'm looking for is a check on a reiserfs filesystem that is
  | mounted read-write. Many modern filesystems, especially those on NAS
  | devices, can run periodic background consistency checks on filesystems
  | with almost zero impact on performance. Some devices are reportedly
  | running these checks constantly, possibly correcting errors without
  | user intervention... even a notification to a sysadmin would be a good
  | feature.

Last time i asked Hans about the possibility to have a --rebuild-tree (for reiserfs) while the fs is online and mounted rw,
he told me to send 30.000 US Dollars in, and that it could eventually be done ;)

Sure lots of people would find this a killer feature, but someone will definitely have to pay get such a feature implemented.

Thanks,

Philippe
