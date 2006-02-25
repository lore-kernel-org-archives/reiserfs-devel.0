From: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>
Subject: Re: creating live virtual files by concatenation
Date: Sat, 25 Feb 2006 22:30:43 +0000
Message-ID: <4400DA93.9080901@st-andrews.ac.uk>
References: <1271316508.20060225153749@dns.toxicfilms.tv> <9a8748490602250735l6161a96dte2805b772a89a436@mail.gmail.com> <612760535.20060225181521@dns.toxicfilms.tv> <Pine.LNX.4.63.0602251339320.13659@cuia.boston.redhat.com> <9a8748490602251052p3e56334ei755c9ce2100e03c@mail.gmail.com> <1391154345.20060225203352@dns.toxicfilms.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28134-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1391154345.20060225203352@dns.toxicfilms.tv>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Maciej Soltysiak <solt2@dns.toxicfilms.tv>
Cc: Jesper Juhl <jesper.juhl@gmail.com>, Rik van Riel <riel@redhat.com>, Jan Engelhardt <jengelh@linux01.gwdg.de>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, Hans Reiser <reiser@namesys.com>

Maciej Soltysiak wrote:

>>I can imagine quite a mess if I open a file that is really a view of
>>several files and then start manipulating text in it across "actual
>>file" boundaries  that could blow up easily.
>>    
>>
>Well, I meant that file to be read-only. Just a quick concatentated view
>for reading.
>  
>
The quick hack might be useful in certain situations. But the really 
interesting way to do it would be not to distinguish beween "actual" and 
"non-actual" files. All of them should be equally "actual", it is just 
that containment (possibly even overlap) would be allowed. The tree 
structure used by a file system such as Reiser4 would make this very 
efficient with each "sub-file" corresponding to a key-range. Writing a 
chapter should change the book that the chapter is part of. That is what 
would make it really valuable. Of course it would have all sorts of 
implications (e.g. for metadata for each part) that need to be thought 
about, but it could be done properly, I think.   Peter
