From: "David Dabbs" <david@dabbs.net>
Subject: RE: mongo benchmark results
Date: Mon, 26 Jul 2004 14:45:42 -0500
Message-ID: <20040726194949.ED7AE15E1D@mail03.powweb.com>
References: <41055771.6070002@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19824-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41055771.6070002@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> -----Original Message-----
> From: Hans Reiser 
> Sent: Monday, July 26, 2004 2:12 PM
> Subject: Re: mongo benchmark results
> 
>
> The 4k results are also valid/important results.  I just tend to choose
> 8k for the website for various valid reasons.
> 
> We probably should try 500 byte file sizes and 50mb file sizes, with
> gamma of 0, just for fun.
> 
> Hans

BTW, I mentioned this in a prior post, but will recap. I get the following
error when attempting to run mongo with OVERWRITE, MODIFY or APPEND = 'on'

...
Use of uninitialized value in concatenation (.) or string at ./mongo.pl line
562.
PHASE OVERWRITE
...

I modified mongo to LOG the command it was attempting to execute. Though I
don't have an example (I'm at work), it appeared that it wasn't correctly
building the command to time, hence the error parsing the time results. I
looked over the parameter checking and didn't see evidence that one should
set these phases to anything but on/off. Since I had limited time and wanted
to get through at least a partial run I punted and simply set these phases
'off.'

david



