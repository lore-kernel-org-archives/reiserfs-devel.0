From: Ming Zhang <mingz@ele.uri.edu>
Subject: Re: file name match speed
Date: Mon, 29 Aug 2005 10:01:46 -0400
Message-ID: <1125324106.5544.39.camel@localhost.localdomain>
References: <1125183549.5569.10.camel@localhost.localdomain>
Reply-To: mingz@ele.uri.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25692-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1125183549.5569.10.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs <reiserfs-list@namesys.com>

read this from reiserfs4 intro on web.

"(Our current default plugin sorts filenames that are less than 15
letters long lexicographically. For those that are more than 15
characters long it sorts them first by their first 8 letters then by the
hash of the whole name.)"

so can this plugin sort my file name as i wish?

thanks!

ming


On Sat, 2005-08-27 at 18:59 -0400, Ming Zhang wrote:
> Hi folks
> 
> I would like to investigate the file name look up performance here.
> 
> assumed i have file name that is in digits, like 1,2,5,12, 43, 61,
> 98,300...
> 
> so how they will be hashed.
> 
> and if i want to look up file named as 64 while no such file available,
> any quick way to find the file 61 in upper example? 
> 
> this is like a database query. select first X with X <=64. :)
> 
> 
> Ming
> 
> 
> 

