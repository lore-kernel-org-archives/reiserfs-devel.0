From: Dushan Tcholich <dusanc@absolutok.net>
Subject: [PATCH 18/8] entd.c cleanup
Date: Tue, 23 Oct 2007 16:41:24 +0200
Message-ID: <1193150484.6236.87.camel@krshina3.gekom>
Reply-To: dusanc@absolutok.net
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-IWYQE1QRy4fRxINggTYF"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-IWYQE1QRy4fRxINggTYF
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



--=-IWYQE1QRy4fRxINggTYF
Content-Disposition: attachment; filename=entd.c.patch
Content-Type: text/x-patch; name=entd.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- entd.c.orig	2007-10-23 16:38:35.000000000 +0200
+++ entd.c	2007-10-23 16:39:51.000000000 +0200
@@ -35,7 +35,7 @@ static int entd(void *arg);
  */
 #define entd_set_comm(state)					\
 	snprintf(current->comm, sizeof(current->comm),	\
-	         "ent:%s%s", super->s_id, (state))
+		"ent:%s%s", super->s_id, (state))
 
 /**
  * reiser4_init_entd - initialize entd context and start kernel daemon
@@ -82,7 +82,7 @@ static struct wbq *__get_wbq(entd_contex
 	if (list_empty(&ent->todo_list))
 		return NULL;
 
-	ent->nr_todo_reqs --;
+	ent->nr_todo_reqs--;
 	wbq = list_entry(ent->todo_list.next, struct wbq, link);
 	list_del_init(&wbq->link);
 	return wbq;
@@ -131,7 +131,7 @@ static int entd(void *arg)
 			while (!list_empty(&ent->done_list)) {
 				rq = list_entry(ent->done_list.next, struct wbq, link);
 				list_del_init(&rq->link);
-				ent->nr_done_reqs --;
+				ent->nr_done_reqs--;
 				spin_unlock(&ent->guard);
 				assert("", rq->written == 1);
 				put_wbq(rq);

--=-IWYQE1QRy4fRxINggTYF--

