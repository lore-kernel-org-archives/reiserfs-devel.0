From: Maciej Soltysiak <solt2@dns.toxicfilms.tv>
Subject: Re: creating live virtual files by concatenation
Date: Sat, 25 Feb 2006 18:15:21 +0100
Message-ID: <612760535.20060225181521@dns.toxicfilms.tv>
References: <1271316508.20060225153749@dns.toxicfilms.tv>
 <9a8748490602250735l6161a96dte2805b772a89a436@mail.gmail.com>
Reply-To: Maciej Soltysiak <solt2@dns.toxicfilms.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28126-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <9a8748490602250735l6161a96dte2805b772a89a436@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jesper Juhl <jesper.juhl@gmail.com>, Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Jesper, Jan,

thanks for your replies. What I had in mind was not a solution
to any specific problem, but a filesystem feature.

A feature that could be used anywhere to have a live version
of files, a bit of what SQL CREATE VIEW could do for databases.

Code files, DNS zones, configuration files, HTML code. We are still
dealing with lots of text files today. Sometimes we do tiresome operations
on them or have to make up solutions similar to which Jesper had
proposed (using cat and updating it, using application level features,etc)

> Might be a cute little hack, but I don't think it's a very useful
> feature really..
Well, I will give FUSE a shot. However I have a hunch that this type
of feature is actually the future of something like filesystem services
for userspace.

Filesystems providing ways for userspace applications to create temporary
files, view, collections based on metadata. But that is completely
an other story, I wanted to keep low with ideas.

-- 
Best regards,
Maciej


