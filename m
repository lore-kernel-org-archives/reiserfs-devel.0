From: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>
Subject: Re: creating live virtual files by concatenation
Date: Sat, 25 Feb 2006 17:40:17 +0000
Message-ID: <200602251740.18712.Peter.Foldiak@st-andrews.ac.uk>
References: <1271316508.20060225153749@dns.toxicfilms.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28127-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1271316508.20060225153749@dns.toxicfilms.tv>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com, Maciej Soltysiak <solt2@dns.toxicfilms.tv>
Cc: linux-kernel@vger.kernel.org

hi, I think it is a good idea but there has been quite a long discusion of 
this issue on the reiserfs-list (some of it also on lkml) in the last few 
years, with the latest posts in May 2005 I think, most of ithem with the 
"file as directory" subject . The idea was if you have e.g. a "book" 
directory/file (object) and chapters within it, then the default action of 
"book" object when read as a file would be to give a concatenation of the 
chapter objects within it. There should be ways of specifying non-default 
actions for the objects too. There has also been a lot a resistance here to 
this idea, as it is quite a radical change to the concept of the conventional 
unstructured, serial "file". (I don't believe these are good reason not to 
try the idea at least.)
Read those mails first. Peter

On Saturday 25 February 2006 14:37, Maciej Soltysiak wrote:
> I have this idea about creating sort of a virtual file.
