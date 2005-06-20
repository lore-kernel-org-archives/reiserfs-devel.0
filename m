From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
Subject: Re: Master file/metadata table? dualistic trees?
Date: Mon, 20 Jun 2005 20:52:49 +0400
Message-ID: <42B6F461.2030109@yandex.ru>
References: <32198.1119057277@www30.gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24427-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <32198.1119057277@www30.gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: kalium@gmx.de
Cc: reiserfs-list@namesys.com

kalium@gmx.de wrote:
> ReiserFS/Reiser4 is supposed to be something like an efficient storage DB
> for lots of small files. Problem: perusing the files' metadata information
> (last modified time, file size etc.) takes much too much time -- most
> probably because that data is scattered all over the disk.
> 
I don't clearly understand the problem, but in Reiser4 sources I've seen a
concept of light-weight stat-data. This means, if you have a lot of 
small files and you don't care about the [amc]time correctness, you may 
ask Reiser4 to use the lightweight stat-data for your millions of files. 
In that case, it won't maintain stat-data objects in the tree for that 
files (it will generate it on-flight), i.e. you'll increase the 
performance greatly.

Not sure this is relevant for you, though.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
