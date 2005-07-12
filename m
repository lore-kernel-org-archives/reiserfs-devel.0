From: Neil Brown <neilb@cse.unsw.edu.au>
Subject: Re: reiser4 plugins
Date: Wed, 13 Jul 2005 09:40:26 +1000
Message-ID: <17108.21738.774180.21984@cse.unsw.edu.au>
References: <hubert@uhoreg.ca>
	<200506290509.j5T595I6010576@laptop11.inf.utfsm.cl>
	<87hdfgvqvl.fsf@evinrude.uhoreg.ca>
	<8783be6605062914341bcff7cb@mail.gmail.com>
	<878y0svj1h.fsf@evinrude.uhoreg.ca>
	<42C4F97B.1080803@slaphack.com>
	<87ll4lynky.fsf@evinrude.uhoreg.ca>
	<42CB0328.3070706@namesys.com>
	<42CB07EB.4000605@slaphack.com>
	<42CB0ED7.8070501@namesys.com>
	<42CB1128.6000000@slaphack.com>
	<42CB1C20.3030204@namesys.com>
	<42CB22A6.40306@namesys.com>
	<42CBE426.9080106@slaphack.com>
	<42D1F06C.9010905@stesmi.com>
	<42D2DB99.9050307@slaphack.com>
	<17107.28428.30907.184223@cse.unsw.edu.au>
	<42D44EA9.7030700@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25114-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: message from David Masover on Tuesday July 12
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: Stefan Smietanowski <stesmi@stesmi.com>, Hans Reiser <reiser@namesys.com>, Hubert Chan <hubert@uhoreg.ca>, Ross Biro <ross.biro@gmail.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Kyle Moffett <mrmacman_g4@mac.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>, Alexander Zarochentcev <zam@namesys.com>, vs <vs@thebsh.namesys.com>, Nate Diller <ndiller@namesys.com>

On Tuesday July 12, ninja@slaphack.com wrote:
> > 
> > Maybe it is worth repeating Al Viro's suggestion at this point.  I
> > don't have a reference but the idea was basically that if you open
> > "/foo" and get filedescriptor N, then
> >    /proc/self/fds/N-meta
> 
> How am I supposed to get there with a shell script?


function get_meta() 
{
   var=$1
   file=$2
   meta=$3
   val=`cat /proc/self/fd/3-meta/$meta < $file`
   eval var=\$val
}

then
   get_meta varname /home/foo/bar username

will read the 'username' meta-file of 'home/foo/bar' and place it in
varname.

Is that what you wanted?

NeilBrown
