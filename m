From: Hans Reiser <reiser@namesys.com>
Subject: Re: Fibration questions
Date: Sun, 18 Jul 2004 00:11:31 -0700
Message-ID: <40FA22A3.5060503@namesys.com>
References: <20040716103441.2BA8715C1D@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19671-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040716103441.2BA8715C1D@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Dabbs <david@dabbs.net>
Cc: reiserfs-list@namesys.com

David Dabbs wrote:

>
>
>Using the fibre for fast extension testing
>A common filesystem client query is for '*.xxx'. If there were (is?) an
>alternate readdir[64]() interface that allowed the caller to pass an
>'extension mask/filter,' then the fibre could be leveraged to quickly test
>whether a given file matches the mask without calling unpack_string(), etc.
>Kind of like saying to the filesystem: 
>
>	SELECT filename WHERE dir = '/home' AND filename LIKE '%.xxx'
>
>A 'fibration map' would need to be specified in an array, say
>
>	const char * fibre_map[] = {"c", "h", "o"...};
>
>or using a structure like
>
>	struct fibre_map_ent {
>		unsigned char fibrno;
>		unsigned char *exten;
>	};
>
>	#define FIBR_MAX 127
>	#define FIBR_DEFAULT FIBR_MAX-1
>	/* should be ordered by exten for searching */
>	const struct fibre_map_ent map[] = 
>	{
>		{.fibrno=6, 	exten="bar"},
>		{.fibrno=0, 	exten="c"},
>		{.fibrno=1, 	exten="h"},
>		{.fibrno=3, 	exten="htm"},
>		{.fibrno=3, 	exten="html"},
>		{.fibrno=2, 	exten="java"},
>		{.fibrno=FIBR_MAX, exten="o"},
>		{.fibrno=4, 	exten="pl"},
>		{.fibrno=5, 	exten="py"}
>		{.fibrno=7, 	exten="xml"}
>	};
>
>	/* 
>		failure to find a match returns 
>
>			FIBRE_NO(FIBR_DEFAULT);
>		else
>
>			FIBRE_NO(map[i].fibro);
>
>
>The enhanced readdir would lookup the mask. If found, it would use the
>fibrno to select appropriate directory entries for the readdir stream.
>Otherwise, it would execute the default readdir code. Of course, this map
>would need to be the global default for the filesystem and per-directory
>fibration override would be prohibited, otherwise readdir would return
>incorrect results.
>
>
>
>  
>
I think this is too implementation dependent of an optimization to be 
allowed to influence API design. 

There is a need for support for * in filename queries.  I would support 
adding that to sys_reiser4.

If FS naming was better designed, filenames would not have extensions.  
I prefer to first better design naming, and then not need to optimize 
the API for extensions.
