From: Philippe =?ISO-8859-1?B?R3JhbW91bGzp?= <philippe.gramoulle@mmania.com>
Subject: Re: [OT] memory issue with GNU find
Date: Fri, 25 Oct 2002 20:23:02 +0200
Message-ID: <20021025202302.633fcce4.philippe.gramoulle@mmania.com>
References: <20021024174330.34f2d72e.philippe.gramoulle@mmania.com>
	<200210251900.33613.russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11782-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200210251900.33613.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Russell Coker <russell@coker.com.au>
Cc: reiserfs <reiserfs-list@namesys.com>


Hi,

On Fri, 25 Oct 2002 19:00:33 +0200
Russell Coker <russell@coker.com.au> wrote:

  |  One issue I noticed with find is that the amount of memory required is 
  |   propertional to the length of the maximum path name.  If you have a very deep 
  |   tree of subdirectories then the amount of memory taken becomes significant.  

Are you aware of a find variant that would be memory limited ? :

If memory usage goes up , then at a certain point, commit everything in RAM to a file
, free up memory, and continue like this again and again.

  |   It's easy to create a set of nested directories that crash find (it's a good 
  |   local DOS attack).
  |  
  |   while /bin/true ; do
  |     mkdir foo
  |     cd foo
  |   done

Users don't have shell access but they could do it over FTP indeed. We already found cases of such very
nested directory.

thanks,

Philippe
