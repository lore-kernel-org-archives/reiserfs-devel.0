From: Hans Reiser <reiser@namesys.com>
Subject: Re: labels like those in gmail
Date: Thu, 09 Sep 2004 17:53:07 -0700
Message-ID: <4140FAF3.1000805@namesys.com>
References: <f18a8d9804090913107d67b94d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21655-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <f18a8d9804090913107d67b94d@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: bedros@computer.org
Cc: reiserfs-list@namesys.com, Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>

I think that simple file and directory syntax provides what you need.

Just keep in mind that in reiser4, storing labels in files is effective 
to do.

Hans

Bedros Hanounik wrote:

>I use reiserfs but not familiar with the technical details. I'm
>wondering if it's possible to use meta tags in reiser4 fs to add
>labels to files.
>
>for example, I could have labels: photo, work, personal, vacation....
>
>then a jpg file from work would have the labels photo and work.
>
>it allows searching my files easier. no need to create different
>directories for different subjects. All files are in the same
>directory and I could browse them using labels.
>
>another advantage is that many files may fall in two categories and
>rather than have multiple copies one in each category, I just apply
>multiple labels for a single copy of the file.
>
>if the answer is yes, does it require a core change to reiserfs or can
>be a plugin.
>
>another question, is the meta tag structure is xml? should it be? XML
>documents waste a lot of space and require more cpu cycles to process,
>but they are extensible and I hope reiser4 tags are also extensible
>
>Thanks,
>
>
>-Bedros
>
>btw, awesome work hans and all reiserfs developers.
>
>
>  
>

