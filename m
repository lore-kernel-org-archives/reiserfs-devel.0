From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Subject: Re: Performance improvements to key comparison functions
Date: Mon, 12 Jul 2004 23:42:14 +0200
Message-ID: <20040712234214.1b128e92@philou.gramoulle.local>
References: <16626.61112.905268.684688@laputa.namesys.com>
	<20040712204952.C0C3A1617F@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19589-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040712204952.C0C3A1617F@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Hello david,

I know Namesys uses at least mongo.pl (http://www.namesys.com/benchmarks/mongo.tar.gz)
 and slow.c ( http://www.jburgess.uklinux.net/slow.c )

See: http://www.namesys.com/benchmarks.html

Thanks,

Philippe

On Mon, 12 Jul 2004 15:49:25 -0500
"David Dabbs" <david@dabbs.net> wrote:

  | 
  | 
  | > Nikita Danilov wrote
  | > That said, I think that proper way to test your functions is to plug
  | > them into kernel reiser4 version and run some CPU intensive tests.
  | 
  | Is bonnie++ the recommended stress tool, or is there a reiser4 stress
  | utility?
  | 
  | 
  | David
  | 
  | 
  | 
