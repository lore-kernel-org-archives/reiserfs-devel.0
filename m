From: Philippe =?ISO-8859-1?B?R3JhbW91bGzp?= <philippe.gramoulle@mmania.com>
Subject: Re: Permission denied !? - will i ever update my system again ? [Slightly OT]
Date: Thu, 18 Jul 2002 11:40:53 +0200
Message-ID: <20020718114053.5b1c56cd.philippe.gramoulle@mmania.com>
References: <1026942850.826.13.camel@prototype>
	<20020718112530.A5226@namesys.com>
	<200207181306.26325.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11042-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <200207181306.26325.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs <reiserfs-list@namesys.com>

On Thu, 18 Jul 2002 13:06:26 +0400
Vitaly Fertman <vitaly@namesys.com> wrote:

  |  >
  |  > Hm. So you have duplicate oid issue most probably, reiserfsck
  |  > --rebuild-tree will cure that. Be sure to update to latest reiserfsprogs
  |  
  |  --fix-fixable will cure about that also.
  |  

BTW, would there be a noticeable difference in term of time it takes
between --fix-fixable and --rebuild-tree ?

(partition is ~600Go full at 65%, _lots_ of dir and files, very nested)

Thanks,

Philippe.
