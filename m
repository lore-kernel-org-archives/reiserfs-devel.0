From: Hans Reiser <reiser@namesys.com>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Fri, 02 Apr 2004 08:20:28 -0800
Message-ID: <406D92CC.1080009@namesys.com>
References: <20040401163120.98834.qmail@web25006.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17669-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040401163120.98834.qmail@web25006.mail.ukl.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Narcoleptic Electron <narcoleptic_electron@yahoo.co.uk>
Cc: reiserfs-list@namesys.com

Narcoleptic Electron wrote:

>This discussion is spiralling out of control.  There
>is far too much misunderstanding.  A discussion
>summary is in order.
>
>PROPOSALS:
>
>1. Leave the "metas" directory as it is, for storing
>the meta data hierarchy.
>  
>
We will do 1.

>2. Rename "metas" to:
>a) ..metas
>b) @
>c) +
>
>3. Revise the architecture so that instead of putting
>meta data into a directory, make it accessible via a
>different path delimiter.  Proposals for a delimiter
>include:
>a) \
>b) @
>c) .
>
>4. Return to the original approach of putting meta
>data files into the parent directory, and prefixing
>the name with:
>a) ..metas.
>
>PROBLEMS:
>
>1. Name clashes with user files; "metas" does not have
>meaning in all non-English languages; too long.
>
>2. Name clashes with user files.
>a) "..metas" does not have meaning in all non-English
>languages; too long.
>b) Conflict with an important mail application's
>directory naming scheme.
>c) No additional problems.
>
>3. All file names containing the delimiter character
>will cause problems; introduces a whole new [arguably
>redundant] fundamental concept.  
>
>4. A step backwards; dramatically increases chance of
>name conflicts (since meta data is no longer in one
>discrete location, but interspersed with user files).
>
>If there are other approaches not addressed here, or
>clarification required, please feel free to revise
>this list.
>
>
>______________________________________________________________________ 
>Post your free ad now! http://personals.yahoo.ca
>
>
>  
>


-- 
Hans


