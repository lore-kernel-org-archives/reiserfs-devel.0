From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Subject: Re: Mongo error while building HTML results
Date: Fri, 6 Aug 2004 15:34:12 +0200
Message-ID: <20040806153412.572abe64@philou.gramoulle.local>
References: <20040806152923.4a4eedc7@philou.gramoulle.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-20042-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040806152923.4a4eedc7@philou.gramoulle.local>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com


Hello,

And BTW, i forgot to say that the results may not be significant at all sin=
ce DEBUG and ASSERTIONS were turned on.
(this is what made my kernel crash, and i ran mongo right after)

I'll send meaningful figures soon.

Does Namesys has publicly available ready made mongo RUN files so that i do=
n't waste my time running meaningless
benchmarks because of bad parameters (gamma, file_size, etc..)

Thanks,

Philippe

On Fri, 6 Aug 2004 15:29:23 +0200
Philippe Gramoull=E9 <philippe.gramoulle@mmania.com> wrote:

  |=20
  |  Hello,
  |=20
  | After the latest snapshot successfully fixed my mount/umount bug, i ran=
 some mongo benchmarks
  | (first to mimic David Dabbs results here : http://dabbs.net/reiser4/mon=
go.html), i couldn't
  | build the HTML results of the dd phases by using mongo_parser.pl. Mongo=
 says that there are uninitialized data:
  |=20
  | (i'm using mongo found here : http://thebsh.namesys.com/benchmarks/mong=
o-2004.07.26.tar.gz)
  |=20
  | I posted the 3 log files and the config file here:
  |=20
  | http://philou.org/linux/reiser4/mongo/reiser4.tbl
  | http://philou.org/linux/reiser4/mongo/reiserfs.tbl
  | http://philou.org/linux/reiser4/mongo/ext3.tbl
  | http://philou.org/linux/reiser4/mongo/config-2.6.8-rc2-mm2
  |=20
  | The broken HTML output is here:
  |=20
  | http://philou.org/linux/reiser4/mongo/mongo.html
  |=20
  |=20
  | While running the reiser4 mongo run i have the following error at the d=
d write sequence:
  |=20
  | Argument "records" isn't numeric in addition (+) at ./mongo.pl line 445.
  | Argument "bytes" isn't numeric in addition (+) at ./mongo.pl line 446.
  |=20
  |=20
  | Thanks,
  |=20
  | Philippe
  |=20
  |=20
