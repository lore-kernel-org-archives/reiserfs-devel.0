From: Hans Reiser <reiser@namesys.com>
Subject: Re: Was able to reproduce "cp: cannot stat file.x: Input/output error"
Date: Fri, 06 Aug 2004 21:15:39 -0700
Message-ID: <4114576B.8040305@namesys.com>
References: <20040806175305.843B415E21@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20053-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040806175305.843B415E21@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Dabbs <david@dabbs.net>
Cc: =?ISO-8859-1?Q?=27Philippe_Gramoull=E9=27?= <philippe.gramoulle@mmania.com>, 'ReiserFS List' <reiserfs-list@namesys.com>

David Dabbs wrote:

>Philippe (or anyone else using my modified Mongo), note that if you use the
>MAX_FNAME_LEN option you should restrict the value to something under 26.
>The extension character is the backtick (dec 96) + the value of the random
>number the code already generates left zero pad the filename in the sprintf.
>i.e. 
>
>	"%.c", '`' + (char) rnd  
>
>If you exceed 26 then you will generate filenames that may cause problems. 
>  
>
Problems that indicate reiser4 bugs or mongo bugs?

>David
>
>
>
>
>
>
>  
>

