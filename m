From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: to compare journalised file systems
Date: Wed, 16 Oct 2002 13:11:20 +0400
Message-ID: <15789.11576.29291.425123@laputa.namesys.com>
References: <3DAD28BB.4060503@eprocess.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11715-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DAD28BB.4060503@eprocess.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fabien Combernous <fcombernous@eprocess.fr>
Cc: reiserfs-list@namesys.com

Fabien Combernous writes:
 > Lo,
 > 
 > Actualy i'm looking for documents about journalised file system, in 
 > order to be able to compare them self. I need accurate information if i 
 > want to make a good study.
 > 
 > Thoses informations have to permit me to get answer about table like this :
 > 

-------------------------------------------------
  Features \ fs   | xfs | ext3 | jfs | reiserfs |
-------------------------------------------------
chattr            |  ?  |  Y   |  ?  | Yes, from 2.4.19
-------------------------------------------------
quotas            |  Y  |  ?   |  Y  | Yes, with Chris patches
-------------------------------------------------
removable fs      |  ?  |  ?   |  N  |    N     |
-------------------------------------------------
NFS               |  Y  |  Y   |  ?  | Yes, better to use 3.6 format for this
-------------------------------------------------
samba             |  ?  |  ?   |  ?  | Yes
-------------------------------------------------
coda              |  ?  |  ?   |  ?  | ?
-------------------------------------------------

 > ...
 > 
 > My line is to remove all '?' by 'Y' or 'N' for all my table.
 > 
 > I know thoses links talking about reiserfs :
 > http://www.namesys.com/
 > http://bulmalug.net/body.phtml?nIdNoticia=1154
 > 
 > but a need more informations.
 > 
 > I know bonnie++ as disk tool tester, but i would like to have several 
 > points of view with several tools.
 > 
 > If you know some others links or books or good tools, you are wellcom.
 > 
 > Thanks Fabien.

Nikita.

 > 
