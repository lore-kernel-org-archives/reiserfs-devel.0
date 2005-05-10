From: Sean McGrath <sean.mcgrath@propylon.com>
Subject: Re: file as a directory
Date: Tue, 10 May 2005 17:30:33 +0100
Message-ID: <4280E1A9.3010703@propylon.com>
References: <2c59f00304112205546349e88e@mail.gmail.com>	 <41A1FFFC.70507@hist.no> <41A21EAA.2090603@dbservice.com>	 <41A23496.505@namesys.com>  <1101287762.1267.41.camel@pear.st-and.ac.uk>	 <1115717961.3711.56.camel@grape.st-and.ac.uk>	 <4280CAEF.5060202@namesys.com> <1115739129.3711.117.camel@grape.st-and.ac.uk>
Reply-To: sean.mcgrath@propylon.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24025-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1115739129.3711.117.camel@grape.st-and.ac.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>
Cc: Hans Reiser <reiser@namesys.com>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Peter Foldiak wrote:

>On Tue, 2005-05-10 at 15:53, Hans Reiser wrote:
>  
>
>>I agree with the below in that sometimes you want to see a collection of
>>stuff as one file, and sometimes you want to see it as a tree, and that
>>file format browsers can be integrated into file system browsers to look
>>seamless to users.
>>
>>A quibble: A name is just a means to select a file; he is completely
>>wrong to think that file browsers will eliminate filenames.
>>    
>>
>
>Yes, even if you think of the whole file system as a single "file", you
>need a way to select the bit you need, and you will use names for that
>(and whether you call that a filename, a file-part name or an object
>name doesn't really matter).
>  
>
The thing that interests me most is the difference (if any) between 
giving a stream of bytes an opaque name e.g. "Chapter 1 of my book.sxw" 
versus giving a stream of bytes a query expression that can also be 
considered an opaque name e.g.
"/book/chapter[1] "

This is what the Russell/Frege descriptive theory of proper names 
applied to storage systems in a sense[1].

I've written about this stuff before on ITWorld (warning: chatty prose 
style ahead):

    Fractals, Self Similarity, and the Whimsical Boundaries of XML Documents
    http://www.itworld.com/nl/xml_prac/04252002/

    A study in XML culture and evolution
    http://www.itworld.com/nl/ebiz_ent/03252003/

[1] http://en.wikipedia.org/wiki/Proper_name

Sean


