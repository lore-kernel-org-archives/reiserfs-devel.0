From: <Nikita@Clusterfs.COM>
Subject: Re: Executability problem
Date: Thu, 1 Sep 2005 15:13:52 +0800
Message-ID: <17174.43568.268660.581234@zeta.clusterfs.com>
References: <20050830152859.45e0b010.Kris.VanBruwaene@vrt.be>
	<b14e81f0050830112173c03579@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25775-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b14e81f0050830112173c03579@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: michael chang <thenewme91@gmail.com>
Cc: reiserfs-list@namesys.com, Kris Van Bruwaene <Kris.VanBruwaene@vrt.be>

michael chang writes:
 > On 8/30/05, Kris Van Bruwaene <Kris.VanBruwaene@vrt.be> wrote:
 > > I recently discovered that scripts have become non-executable on my reiserfs share, even though the -x flags are set:
 > > root@A00012344:/home/kris# cat tst
 > > #! /usr/bin/perl -w
 > > print "Hello world\n";
 > > root@A00012344:/home/kris# ./tst
 > > bash: ./tst: /usr/bin/perl: bad interpreter: Toegang geweigerd #(=Access denied)
 > 
 > I believe the line should read
 > #!/usr/bin/perl -w
 > not 
 > #! /usr/bin/perl -w
 > 
 > [no space between "!" and first "/"]
 > 
 > unless that's a typo between output and your file.

Actually, space between shell-bang and the path to the interpreter is
perfectly legal in Linux.

Kris, what is the output of

$ cat /proc/mounts

?

 > 
 > -- 
 > ~Mike
 >  - Just my two cents
 >  - No man is an island, and no man is unable.
 > 

Nikita.

