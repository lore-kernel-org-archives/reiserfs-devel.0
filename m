From: "David Dabbs" <david@dabbs.net>
Subject: RE: Was able to reproduce "cp: cannot stat file.x: Input/output error"
Date: Fri, 6 Aug 2004 12:46:02 -0500
Message-ID: <20040806175305.843B415E21@mail03.powweb.com>
References: <20040806191045.37527e99@philou.gramoulle.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20047-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040806191045.37527e99@philou.gramoulle.local>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: =?iso-8859-1?Q?'Philippe_Gramoull=E9'?= <philippe.gramoulle@mmania.com>
Cc: 'ReiserFS List' <reiserfs-list@namesys.com>


Philippe (or anyone else using my modified Mongo), note that if you use the
MAX_FNAME_LEN option you should restrict the value to something under 26.
The extension character is the backtick (dec 96) + the value of the random
number the code already generates left zero pad the filename in the sprintf.
i.e. 

	"%.c", '`' + (char) rnd  

If you exceed 26 then you will generate filenames that may cause problems. 

David




