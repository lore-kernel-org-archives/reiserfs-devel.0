From: "David Dabbs" <david@dabbs.net>
Subject: Fibration questions
Date: Fri, 16 Jul 2004 05:35:59 -0500
Message-ID: <20040716103441.2BA8715C1D@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19656-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com



I'm curious why the fibration function prototypes take an inode* (that is
unused)? I looked at struct_inode and I can't see anything that looks
helpful to calculating a fibre.

/* fibration.c: sample fibration_plugin.fibre() function proto */ 
static __u64 fibre_dot_o(const struct inode *dir, const char *name, int
len);



Since fibre_dot_o is the default fibration plugin, could it be safely
shortened from:

	if (len > 2 && name[len - 1] == 'o' && name[len - 2] == '.')
		return FIBRE_NO(1);
	else
		return FIBRE_NO(0);

to

return FIBRE_NO((len > 2 && name[len - 1] == 'o' && name[len - 2] == '.'));

since the boolean expression will always return 1 or 0?



In Nikita's explanation of fibration [http://kerneltrap.org/node/view/2761]
(keeping .o files separate form all other files to speed compilation), would
there be any advantage to the following function?

	unsigned char no=1;
	if (len > 2 && name[len - 2] == '.') {
		switch (name[len - 1]) {
		case: 'c'
		case: 'h'
			no=0
			break;

		case: 'o'
			no = 2;
			break;

		}
	}
	return FIBRE_NO(no);



Using the fibre for fast extension testing
A common filesystem client query is for '*.xxx'. If there were (is?) an
alternate readdir[64]() interface that allowed the caller to pass an
'extension mask/filter,' then the fibre could be leveraged to quickly test
whether a given file matches the mask without calling unpack_string(), etc.
Kind of like saying to the filesystem: 

	SELECT filename WHERE dir = '/home' AND filename LIKE '%.xxx'

A 'fibration map' would need to be specified in an array, say

	const char * fibre_map[] = {"c", "h", "o"...};

or using a structure like

	struct fibre_map_ent {
		unsigned char fibrno;
		unsigned char *exten;
	};

	#define FIBR_MAX 127
	#define FIBR_DEFAULT FIBR_MAX-1
	/* should be ordered by exten for searching */
	const struct fibre_map_ent map[] = 
	{
		{.fibrno=6, 	exten="bar"},
		{.fibrno=0, 	exten="c"},
		{.fibrno=1, 	exten="h"},
		{.fibrno=3, 	exten="htm"},
		{.fibrno=3, 	exten="html"},
		{.fibrno=2, 	exten="java"},
		{.fibrno=FIBR_MAX, exten="o"},
		{.fibrno=4, 	exten="pl"},
		{.fibrno=5, 	exten="py"}
		{.fibrno=7, 	exten="xml"}
	};

	/* 
		failure to find a match returns 

			FIBRE_NO(FIBR_DEFAULT);
		else

			FIBRE_NO(map[i].fibro);


The enhanced readdir would lookup the mask. If found, it would use the
fibrno to select appropriate directory entries for the readdir stream.
Otherwise, it would execute the default readdir code. Of course, this map
would need to be the global default for the filesystem and per-directory
fibration override would be prohibited, otherwise readdir would return
incorrect results.

