From: Hans Reiser <reiser@namesys.com>
Subject: Re: ReConfigurable Directory Structure & Agrregation of files according
 to semantic.
Date: Wed, 17 Mar 2004 11:14:12 +0300
Message-ID: <405808D4.6080309@namesys.com>
References: <20040317075333.96561.qmail@web60404.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17267-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040317075333.96561.qmail@web60404.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: faraz ahmed <faraz_irulz@yahoo.com>
Cc: Isaac Claymore <clay@exavio.com.cn>, reiserfs-list@namesys.com

Namesys is going to implement a semi-structured data  query language in 
the fs for version 6.  You should take a look at it at 
www.namesys.com/whitepaper.html, as there are definite reasons to go 
beyond the relational model.



faraz ahmed wrote:

>Hi Isaac;
>         The user space implementation u are talking
>about has to be done for each file type seperately.
>Example the Winamp playlist can only organize mp3's
>wherelese our FS can aggregate any type of data
>becuase  each file has attribs (name,value pairs) .
>And the directory listing is done acc Relational
>queryies on these attributes.
>          Anyways the Winamp playlist can only be used
>by winamp & other application have no way to use the
>files organized in a playlist. Where as in our case
>the 
>aggregation is done by the file system, so all apps 
>can use the organization without change.
>          Exactly we do our processing in the user
>space & just display the results under the FS.(Micro
>kernel sorts of)
>                                Regards.
>                                 Faraz.
>
>  
>


-- 
Hans

