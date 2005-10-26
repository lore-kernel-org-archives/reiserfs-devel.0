From: Peter van Hardenberg <pvh@uvic.ca>
Subject: Re: Our introduction to Reiser-list
Date: Tue, 25 Oct 2005 17:04:55 -0700
Message-ID: <200510251704.56000.pvh@uvic.ca>
References: <200510251558.13860.pvh@uvic.ca> <435EBB09.5030200@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26645-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <435EBB09.5030200@namesys.com>
Content-disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On October 25, 2005 04:08 pm, you wrote:
> Peter van Hardenberg wrote:
> >Hello all,
> >
> >I'm a student at the University of Victoria. Between myself and a few
> > fellow students we have embarked on a quest to do some experiments with
> > the Reiser4 metadata system to show it off and provide some real world
> > use cases.
> >
> >We'll be spending lots of time on this project between now and the end of
> > the year. If list members have ideas for interesting experiments, please,
> > join in and suggest them.
> >
> >So far, we have a few nifty ideas:
> >
> >1) tie the 'extract' utility to a shell script to copy existing metadata
> > down into the filesystem
>
> what is the extract utility?
>

Extract is a utility that recognizes many different file formats and extracts 
their metadata. For example:

pvh@arroyo:~ $ /usr/bin/extract music/Audioslave\ -\ Like\ a\ Stone.mp3
format - 192 bps, 44100 hz, 4m58 stereo
resource-type - MPEG V1
mimetype - audio/mpeg
description - Audioslave: Like a Stone (final mixdown)
comment - finalmix by Francis/AndyWarh
genre - Rock
date - 2002
album - final mixdown
artist - Audioslave
title - Like a Stone
genre - 17
comment -
date - 2002C
album - final mixdownT
artist - AudioslaveT
title - Like a StoneT
pvh@arroyo:~ $


> >2) create a (very slow) shell which operates on the filesystem by xpath
> > query.
>
> can you say three paragraphs here?
>

I envision creating a simple shell in a scripting language which will operate 
on an XML representation of the filesystem which maps, in the simple case, 
directories and files such that simple xpath queries appear identical to 
normal filesystem queries.

For example, if the XML looked like this:

<home>
   <pvh>
      <music>
          <audioslave.mp3 artist="Audioslave"/>
          <radiohead.mp3 artist="Radiohead"/>
      </music>
   </pvh>
   <norbs>
      <music>
         <chuckberry.mp3 artist="Chuck Berry"/>
         <ledzeppelin.mp3 artist="Led Zeppelin"/>
      </music>
   </norbs>
</home>


You could retrieve the first <music> node via "/home/pvh/music".
The query "//music" would return a list containing the nodes in any music 
element. The query "//norbs[//@artist = 'Chuck Berry']" would only return 
norbs' node if somewhere in that node was a file with a Chuck Berry artist 
attribute.

For more information, check out any good xPath tutorial. There would have to 
be some minor modifications due to namespace limitations of XML elements, but 
the principle would remain the same.

>
> >Our first contribution will be a practical guide to installing Reiser4
> > (with metadata enabled) under Ubuntu 5.10.
>
> Oh, that sounds great, it will go onto our website under the install
> button if you are kind enough to allow that. 
>

Of course.

-p

-- 
Peter van Hardenberg (pvh@pvh.ca)
Victoria, BC, Canada
