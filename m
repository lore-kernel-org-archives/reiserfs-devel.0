From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Will Reiser4 support a "hidden" attribute?
Date: Thu, 20 Nov 2003 21:49:39 +0300
Message-ID: <16317.3267.987713.833145@laputa.namesys.com>
References: <20031120005844.GC8854@Benine>
	<1069305523.11497.37.camel@faith>
	<20031120142353.GA1253@Benine>
	<3FBC6050.3050600@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16135-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FBC6050.3050600@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Guido Schimmels <guido.schimmels@freenet.de>, reiserfs-list@namesys.com

Hans Reiser writes:
 > Nikita, please update us all on how far we have gotten in implementing this.

OK.

We currently don't have ability to hide particular file. That is, there
is no way to somehow mark file hidden at the kernel level. If I am
allowed to humbly voice my opinion, usages shown by participants of this
thread (trimming down list of files visible in the GUI front-end) should
be done at the user level. In UNIX ls(1) command hides dot files for
ages.

On the other hand, some file system objects (pseudo files
http://namesys.com/v4/pseudo.html) are not shown by the readdir(2). But
this is to keep various utilities like cp(1) and friends from trying to
read from them.

 > 
 > -- 
 > Hans
 > 
 > 

Nikita.
