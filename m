From: Hans Reiser <reiser@namesys.com>
Subject: Re: Recursive modfied-timestamp?
Date: Sat, 01 Jan 2005 13:49:22 -0800
Message-ID: <41D71AE2.6050808@namesys.com>
References: <200412311047.14634.namesys.Sch@ttgen.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23022-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200412311047.14634.namesys.Sch@ttgen.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Fred Schaettgen <namesys.Sch@ttgen.net>
Cc: reiserfs-list@namesys.com

Fred Schaettgen wrote:

>Hi,
>
>Does reiser4 support something like recursive last-modified-timestamps? What I 
>mean is an attribute which contains the latest modification date of all 
>subdirectories and files below a given directory.
>
>Actually I am also curios if there are any other linux file system which 
>support that. The reason I'm asking on the reiserfs mailinglist is that 
>reiser4 seems to be the filesystem which is most open for new features.
>Could this be implemented as some sort of plugin for reiser4? Or does/will 
>reiser4 support any other concepts which can be used for that purpose?
>
>The purpose btw. is to find all modified files in a tree as fast as possible. 
>There are quite a lot of application which would benefit from it: desktop 
>search engines, locate, build systems, tools which visualize contents of a 
>file system (like fsview in KDE), backup tools etc.
>
>I know that modifying an attibute recursively on every update of the stat data 
>would have a huge perfomance impact, but there are many things that could be 
>done to keep the extra load low for most of the time.
>It seem very likely that this is an idea which was discussed over and over 
>again already, but I really didn't find much about it. As a KDE developer, 
>I'm not much involved in filesystems, so maybe I'm just looking for the wrong 
>keywords?
>
>Fred
>
>  
>
We intend to implement inheritance of metadata, which could  be made to 
accomplish what you are asking for I think.  Nobody is coding that at 
the moment though....

We are indeed open to semantic enhancements.
