From: Nikita Danilov <Nikita@Clusterfs.COM>
Subject: Re: Fibration questions
Date: Fri, 16 Jul 2004 15:04:49 +0400
Message-ID: <16631.46673.26333.276372@laputa.namesys.com>
References: <20040716103441.2BA8715C1D@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19657-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040716103441.2BA8715C1D@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Dabbs <david@dabbs.net>
Cc: reiserfs-list@namesys.com

David Dabbs writes:
 > 
 > 
 > I'm curious why the fibration function prototypes take an inode* (that is
 > unused)? I looked at struct_inode and I can't see anything that looks
 > helpful to calculating a fibre.

This for more advanced fibration plugins that keep some per-directory
state (none at the moment).

 > 
 > /* fibration.c: sample fibration_plugin.fibre() function proto */ 
 > static __u64 fibre_dot_o(const struct inode *dir, const char *name, int
 > len);
 > 
 > 
 > 
 > Since fibre_dot_o is the default fibration plugin, could it be safely
 > shortened from:
 > 
 > 	if (len > 2 && name[len - 1] == 'o' && name[len - 2] == '.')
 > 		return FIBRE_NO(1);
 > 	else
 > 		return FIBRE_NO(0);
 > 
 > to
 > 
 > return FIBRE_NO((len > 2 && name[len - 1] == 'o' && name[len - 2] == '.'));
 > 
 > since the boolean expression will always return 1 or 0?
 > 

Well, what would this achieve (besides code obfuscation)? I highly
doubt that one can present a work-load where fibration calls will be
CPU bottlenecks. Premature optimization is a root of all evil, as they
say.

 > 
 > 
 > In Nikita's explanation of fibration [http://kerneltrap.org/node/view/2761]
 > (keeping .o files separate form all other files to speed compilation), would
 > there be any advantage to the following function?
 > 
 > 	unsigned char no=1;
 > 	if (len > 2 && name[len - 2] == '.') {
 > 		switch (name[len - 1]) {
 > 		case: 'c'
 > 		case: 'h'
 > 			no=0
 > 			break;
 > 
 > 		case: 'o'
 > 			no = 2;
 > 			break;
 > 
 > 		}
 > 	}
 > 	return FIBRE_NO(no);

The whole point of having plugin infrastructure is that one is able to
play with new file system policies easily. Just try it!

 > 
 > 
 > 
 > Using the fibre for fast extension testing
 > A common filesystem client query is for '*.xxx'. If there were (is?) an
 > alternate readdir[64]() interface that allowed the caller to pass an
 > 'extension mask/filter,' then the fibre could be leveraged to quickly test
 > whether a given file matches the mask without calling unpack_string(), etc.
 > Kind of like saying to the filesystem: 
 > 
 > 	SELECT filename WHERE dir = '/home' AND filename LIKE '%.xxx'

There is no such system call (there are user-level functions with the
similar functionality, fts(3), and scandir(3)).

sys_reiser4() system call is targeted to similar data-base like kind
of access paths.

 > 
 > A 'fibration map' would need to be specified in an array, say
 > 
 > 	const char * fibre_map[] = {"c", "h", "o"...};
 > 
 > or using a structure like
 > 
 > 	struct fibre_map_ent {
 > 		unsigned char fibrno;
 > 		unsigned char *exten;
 > 	};
 > 
 > 	#define FIBR_MAX 127
 > 	#define FIBR_DEFAULT FIBR_MAX-1
 > 	/* should be ordered by exten for searching */
 > 	const struct fibre_map_ent map[] = 
 > 	{
 > 		{.fibrno=6, 	exten="bar"},
 > 		{.fibrno=0, 	exten="c"},
 > 		{.fibrno=1, 	exten="h"},
 > 		{.fibrno=3, 	exten="htm"},
 > 		{.fibrno=3, 	exten="html"},
 > 		{.fibrno=2, 	exten="java"},
 > 		{.fibrno=FIBR_MAX, exten="o"},
 > 		{.fibrno=4, 	exten="pl"},
 > 		{.fibrno=5, 	exten="py"}
 > 		{.fibrno=7, 	exten="xml"}
 > 	};
 > 
 > 	/* 
 > 		failure to find a match returns 
 > 
 > 			FIBRE_NO(FIBR_DEFAULT);
 > 		else
 > 
 > 			FIBRE_NO(map[i].fibro);
 > 
 > 
 > The enhanced readdir would lookup the mask. If found, it would use the
 > fibrno to select appropriate directory entries for the readdir stream.
 > Otherwise, it would execute the default readdir code. Of course, this map
 > would need to be the global default for the filesystem and per-directory
 > fibration override would be prohibited
