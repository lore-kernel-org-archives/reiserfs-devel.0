From: Hans Reiser <reiser@namesys.com>
Subject: Re: file name match speed
Date: Mon, 29 Aug 2005 13:19:18 -0700
Message-ID: <43136DC6.5000005@namesys.com>
References: <1125183549.5569.10.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25711-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1125183549.5569.10.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: mingz@ele.uri.edu
Cc: reiserfs <reiserfs-list@namesys.com>

Ming Zhang wrote:

>Hi folks
>
>I would like to investigate the file name look up performance here.
>
>assumed i have file name that is in digits, like 1,2,5,12, 43, 61,
>98,300...
>
>so how they will be hashed.
>
>and if i want to look up file named as 64 while no such file available,
>any quick way to find the file 61 in upper example? 
>
>this is like a database query. select first X with X <=64. :)
>
>
>Ming
>
>
>
>
>
>  
>
It would be useful to add such functionality to sys_reiser4.
