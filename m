From: Nikita Danilov <Nikita@Clusterfs.COM>
Subject: Re: Was able to reproduce "cp: cannot stat file.x: Input/output error"
Date: Mon, 9 Aug 2004 19:13:28 +0400
Message-ID: <16663.38040.898214.643240@laputa.namesys.com>
References: <20040808071141.BFDB615C8A@mail03.powweb.com>
	<41166C28.6030402@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20083-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41166C28.6030402@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: David Dabbs <david@dabbs.net>, 'ReiserFS List' <reiserfs-list@namesys.com>, Alexander Zarochentcev <zam@namesys.com>, "E. Gryaznova" <grev@namesys.com>

Hans Reiser writes:
 > David Dabbs wrote:
 > 
 > >  
 > >
 > >>-----Original Message-----
 > >>From: Hans Reiser [mailto:reiser@namesys.com]
 > >>Sent: Saturday, August 07, 2004 11:18 PM
 > >>To: David Dabbs
 > >>Subject: Re: Was able to reproduce "cp: cannot stat file.x: Input/output
 > >>error"
 > >>
 > >>    
 > >>
 > >
 > >  
 > >
 > >>How about, code was X, now it is Y, with just the relevant parts of the
 > >>code cited?
 > >>    
 > >>
 > >
 > >Probably the most significant change to mongo sources is how it generates
 > >file names. Mongo.pl had a hard coded value of 6 for the "max_fname"
 > >parameter passed to reiser_fract_tree. I made this a parameter one can
 > >specify on the mongo command line. I passed it a value of 23.
 > >  
 > >
 > most filenames are small.  We have an optimization in reiser4 that 
 > assumes filenames are less than 15 characters, which most of them are.

With large keys (which is the default) up to 23 characters are
embedded into key.

[...]

Nikita.
