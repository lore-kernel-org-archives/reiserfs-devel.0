From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: file as a directory
Date: Wed, 24 Nov 2004 17:11:28 +0100
Message-ID: <200411241711.28393.christian.mayrhuber@gmx.net>
References: <2c59f00304112205546349e88e@mail.gmail.com> <1101287762.1267.41.camel@pear.st-and.ac.uk> <4d8e3fd304112407023ff0a33d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel=40m.gmane.org-S262691AbUKXQOX@vger.kernel.org>
In-Reply-To: <4d8e3fd304112407023ff0a33d@mail.gmail.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com, Paolo Ciarrocchi <paolo.ciarrocchi@gmail.com>, peter.foldiak@st-andrews.ac.uk
Cc: linux-kernel@vger.kernel.org

On Wednesday 24 November 2004 16:02, Paolo Ciarrocchi wrote:
> On 24 Nov 2004 09:16:03 +0000, Peter Foldiak
> <peter.foldiak@st-andrews.ac.uk> wrote:
> [...] 
> > I would really like to implement this for the next version of Hans' file
> > system.
> 
> I don't undersand how you want to use Xpath for not XML file.
> I agree with you that the idea behind Xpath is cool but I fail to
> unserstand how it can be applied to anything but XML
> 
> -- 
> Paolo
> Picasa users groups: www.picasa-users.tk
> join the blog group: http://groups-beta.google.com/group/blog-users
> 

Apache Cocoon uses so called generators to parse non-XML formats and produce a 
XML representation thereof. This XML can be addressed by XPath.
To store modifications back this XML needs to be serialized to the original
format. That's **very** fat and slow.

Maybe an automount with a special fuse filesystem could accomplish this.

For example:
# cd /etc/passwd/..metas/contents/

automounts /etc/passwd as "fuse-xpath-passwd" fs 
to /etc/passwd/..metas/contents/

Doing 'cat /etc/passwd/..metas/contents/shell[username = "joe"]' could work 
then.

Reiser4 would need a content-mount plugin that automounts
the respective file by means of a per file configureable
mount command. Something like
# cat /etc/passwd/..metas/plugins/content-mount
-t fuse-xpath-passwd -o ro

fuse-xpath-* filesystems would have to be written. These could be designed 
similiar to the apache cocoon approach of generators/serializers to
work with an intermediate XML representation of the file interior.

All the stuff besides mounting the fuse-xpath-fs's would happen in userspace.
I don't think that anyone can guarantee posix fs semantics by this approach.

-- 
lg, Chris
