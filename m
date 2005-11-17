From: Edward Shishkin <edward@namesys.com>
Subject: Re: Regular Plugin
Date: Thu, 17 Nov 2005 22:56:17 +0300
Message-ID: <437CE061.10203@namesys.com>
References: <200511161004.51277.pvh@uvic.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26989-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200511161004.51277.pvh@uvic.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Peter van Hardenberg <pvh@uvic.ca>
Cc: reiserfs-list@namesys.com

Peter van Hardenberg wrote:

>The notion of the regular plugin seems odd to me. It is a seperate plugin type 
>with distinct plugins that only serve to refer to "file" plugins (which are 
>found in plugin/object.c, not in plugin/file/*.c).
>  
>

In accordance with the last policy file plugins, that implement objects 
which are known
(for vfs) as regular files, should be stored in plugin/file directory, 
so in the latest versions
of reiser4 the file regular.c has been moved to the upper common 
directory "plugin".

>So when I create a new "file" plugin, I cannot use it unless I also create a 
>"regular" plugin which serves no purpose except to allow me to create those 
>"file"s by storing their ID. 
>  
>

You are right.

>A few words explaining why the "regular" plugin field couldn't have somehow 
>storeda "file" plugin would be educational. 
>

Because changing a file plugin id is unsafe operation (at least in the 
case when there is
more then one field of file plugin type in struct plugin_set): suppose 
you allow a some
file plugin to be changed, it means that users also will be able to 
change foo/..../plugin/file,
the main plugin which manages the file "foo". This is why we added a 
special plugin type:
feel free to change these plugins.

>Also, regular is a rather unclear 
>name. Something like "defaultfileplugin" might be easier to deduce, or even 
>"defaultchild".
>
>  
>

Perhaps you are right about clearness, but the reason for the name 
"regular" was the need for
nominated children to be "regular files for vfs". This is why 
"defaultfileplugin" sounds not
so good (file plugin can be a directory file plugin, whereas mkdir 
doesnt look at this field
at all, and "default" sounds like something that is not to be modified). 
Maybe "regularchild"
will improve the situation?

Thanks,
Edward.

>-pvh
>
>  
>

