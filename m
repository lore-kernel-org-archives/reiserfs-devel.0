From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: file as a directory
Date: Mon, 22 Nov 2004 19:16:50 +0100 (MET)
Message-ID: <Pine.LNX.4.53.0411221916290.27104@yvahk01.tjqt.qr>
References: <2c59f00304112205546349e88e@mail.gmail.com>
 <20041122143720.GL19738@admingilde.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-22505-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041122143720.GL19738@admingilde.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Martin Waitz <tali@admingilde.org>
Cc: Amit Gud <amitgud1@gmail.com>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

>>  A straight forward question. Wouldn't adding a "file as a directory"
>> mechanism more logical in VFS itself, rather than having each fs (like
>> reiser4) to implement it seperately?
>
>wouldn't it be better if such things would be implemented in a library?
>use gnome-vfs, or try to get a vfs layer into libc.
>That way you can even support different and old kernels and all
>filesystems.
>
>The kernel already provides all methods that are neccessary to do that.
>So there is no need to implement it in the kernel.


*cough* FUSE... *cough*




Jan Engelhardt
-- 
Gesellschaft für Wissenschaftliche Datenverarbeitung
Am Fassberg, 37077 Göttingen, www.gwdg.de
