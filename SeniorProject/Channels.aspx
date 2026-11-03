<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Channels.aspx.cs" Inherits="SeniorProject.Channels" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Channels</title>
    <style>
        * { box-sizing: border-box; }
        :root { --pink:#d46a92; --purple:#b565a7; --ink:#34242f; --muted:#806f7b; --border:#efd9e3; --pale:#fff7fb; --rose:#f9e5ef; }
        body { margin:0; font-family:Segoe UI,Arial,sans-serif; background:#fff9fb; color:var(--ink); }
        button,input,textarea,select { font:inherit; }
        button { cursor:pointer; }
        button:focus-visible,input:focus-visible,textarea:focus-visible,select:focus-visible { outline:3px solid #b565a788; outline-offset:2px; }
        .topbar { height:68px; background:white; border-bottom:1px solid #f3c6d3; display:flex; align-items:center; justify-content:space-between; padding:0 30px; gap:18px; }
        .brand { font-size:21px; font-weight:800; color:var(--pink); text-decoration:none; }
        .toplinks { display:flex; gap:22px; align-items:center; }
        .toplinks a { text-decoration:none; color:#776975; font-weight:600; font-size:14px; }
        .toplinks a.active,.toplinks a:hover { color:var(--pink); }
        .shell { display:grid; grid-template-columns:72px 250px minmax(0,1fr); min-height:calc(100vh - 68px); max-width:1600px; margin:auto; background:white; border-left:1px solid var(--border); border-right:1px solid var(--border); }
        .rail { background:#f4dce8; display:flex; flex-direction:column; align-items:center; gap:14px; padding:22px 12px; border-right:1px solid #eed0de; }
        .rail button { width:46px; height:46px; border:0; border-radius:15px; background:#fff5fa; color:#a65b91; font-size:23px; transition:.15s; }
        .rail button:hover,.rail button.active { background:var(--pink); color:white; box-shadow:0 5px 15px #d46a9240; }
        .rail .rail-bottom { margin-top:auto; }
        .side { background:#fff7fb; border-right:1px solid var(--border); padding:25px 16px; display:flex; flex-direction:column; gap:19px; min-width:0; }
        .side h2 { font-size:22px; margin:0 0 3px; }
        .side-sub { color:var(--muted); font-size:13px; margin:0; line-height:1.5; }
        .side-heading { display:flex; align-items:center; justify-content:space-between; font-size:11px; font-weight:800; color:#a35c83; letter-spacing:1px; text-transform:uppercase; }
        .icon-add { border:0; background:transparent; color:var(--purple); font-size:24px; line-height:1; padding:2px 7px; border-radius:8px; }
        .icon-add:hover { background:var(--rose); }
        .channel-list { display:flex; flex-direction:column; gap:5px; overflow:auto; max-height:calc(100vh - 330px); }
        .channel { text-align:left; border:0; border-radius:11px; background:transparent; padding:11px 12px; color:#675564; font-weight:600; overflow-wrap:anywhere; }
        .channel:hover,.channel.selected { background:#f7dce7; color:#9c456c; }
        .side-empty { border:1px dashed #e9cbd9; border-radius:15px; padding:22px 12px; text-align:center; color:#937787; font-size:13px; line-height:1.5; }
        .side-empty .big { display:block; color:var(--pink); font-size:25px; margin-bottom:5px; }
        .side-tip { margin-top:auto; background:#fce8f0; padding:15px; border-radius:14px; }
        .side-tip strong { color:#9c456c; font-size:13px; }
        .side-tip p { color:#8d7182; font-size:12px; line-height:1.5; margin:7px 0 12px; }
        .main { min-width:0; display:flex; flex-direction:column; }
        .main-head { min-height:74px; border-bottom:1px solid var(--border); display:flex; align-items:center; justify-content:space-between; padding:17px 30px; gap:12px; }
        .main-head h1 { margin:0; font-size:19px; }
        .main-head p { margin:4px 0 0; color:var(--muted); font-size:12px; }
        .primary { background:var(--pink); color:white; border:1px solid var(--pink); border-radius:11px; padding:11px 16px; font-size:13px; font-weight:700; }
        .primary:hover { background:#c65780; }
        .outline { background:white; border:1px solid #e8c4d5; color:#a45179; border-radius:11px; padding:10px 15px; font-size:13px; font-weight:700; }
        .outline:hover { background:#fff2f7; }
        .content { flex:1; padding:26px 30px; min-height:0; }
        .center-empty { min-height:440px; display:flex; flex-direction:column; justify-content:center; align-items:center; text-align:center; max-width:430px; margin:0 auto; }
        .empty-symbol { width:90px; height:90px; display:grid; place-items:center; background:#fce8f0; border-radius:30px; font-size:39px; color:var(--pink); margin-bottom:22px; }
        .center-empty h2 { font-size:24px; margin:0 0 10px; }
        .center-empty p { font-size:14px; color:var(--muted); line-height:1.7; margin:0 0 22px; }
        .view { display:none; flex:1; flex-direction:column; min-height:0; }
        .view.active { display:flex; }
        .section-intro { margin-bottom:22px; }
        .section-intro h2 { font-size:23px; margin:0 0 7px; }
        .section-intro p { color:var(--muted); margin:0; font-size:14px; line-height:1.6; }
        .tabs { display:flex; flex-wrap:wrap; gap:8px; margin-bottom:22px; }
        .tabs button { border:1px solid var(--border); background:white; border-radius:10px; padding:10px 14px; font-weight:700; font-size:13px; color:#836b7a; }
        .tabs button.active { background:var(--rose); border-color:#efc1d5; color:#a34d75; }
        .post-list { display:flex; flex-direction:column; gap:14px; }
        .post { border:1px solid var(--border); border-radius:16px; padding:19px; background:white; }
        .post h3 { margin:0 0 9px; font-size:16px; overflow-wrap:anywhere; }
        .post p { color:#6e606a; white-space:pre-wrap; overflow-wrap:anywhere; font-size:14px; line-height:1.65; margin:0 0 15px; }
        .post small { color:#9b8794; }
        .post-actions { display:flex; flex-wrap:wrap; gap:8px; }
        .post-actions button { border:1px solid var(--border); border-radius:9px; background:#fff9fb; padding:8px 11px; color:#985675; font-size:12px; font-weight:700; }
        .post-actions button:hover { background:var(--rose); }
        .post.completed { opacity:.65; }
        .post.completed h3 { text-decoration:line-through; }
        .notice { border:1px dashed #e9cbd9; background:#fffbfd; border-radius:16px; padding:40px 20px; text-align:center; color:var(--muted); line-height:1.6; font-size:14px; }
        .notice strong { display:block; color:var(--ink); font-size:17px; margin-bottom:7px; }
        .chat-layout { display:flex; flex-direction:column; flex:1; min-height:0; }
        .chat-messages { display:flex; flex-direction:column; gap:13px; padding:22px 30px; overflow-y:auto; flex:1; min-height:220px; }
        .message { background:#fff5fa; border:1px solid #f3d9e5; border-radius:15px; padding:12px 15px; max-width:78%; align-self:flex-end; overflow-wrap:anywhere; }
        .message small { display:block; color:#a06a84; margin-bottom:5px; }
        .message p { margin:0; white-space:pre-wrap; line-height:1.55; font-size:14px; }
        .composer { border-top:1px solid var(--border); padding:16px 25px; display:flex; gap:10px; }
        .composer input { flex:1; min-width:0; border:1px solid #e8cbd9; border-radius:12px; padding:13px; }
        .chat-empty { flex:1; display:flex; align-items:center; justify-content:center; padding:20px; }
        .chat-empty .center-empty { min-height:280px; }
        .modal-backdrop { display:none; position:fixed; inset:0; background:#24152188; z-index:10; align-items:center; justify-content:center; padding:18px; }
        .modal-backdrop.open { display:flex; }
        .modal { background:white; width:min(100%,490px); max-height:90vh; overflow-y:auto; border-radius:20px; padding:25px; box-shadow:0 22px 75px #2b142744; }
        .modal-top { display:flex; justify-content:space-between; align-items:center; gap:10px; margin-bottom:20px; }
        .modal h2 { margin:0; font-size:22px; }
        .close { background:#fff1f7; border:0; border-radius:9px; width:35px; height:35px; color:#995b7d; font-size:22px; }
        .field { display:block; margin-bottom:16px; }
        .field span { display:block; font-size:13px; font-weight:700; margin-bottom:7px; }
        .field input,.field textarea,.field select { width:100%; padding:12px 13px; border:1px solid #e7cbd9; border-radius:10px; background:white; color:var(--ink); }
        .field textarea { min-height:105px; resize:vertical; }
        .field-hint { color:var(--muted); font-size:12px; margin:0 0 15px; }
        .modal-actions { display:flex; justify-content:flex-end; gap:9px; }
        .danger-action{background:#ba4766!important;color:white!important}
        .confirm-copy{line-height:1.6;color:#776975;margin-bottom:22px}
        .report-note { margin-top:15px; color:var(--muted); font-size:12px; line-height:1.6; }
        @media(max-width:850px) { .shell { grid-template-columns:62px 190px minmax(0,1fr); } .topbar { padding:0 15px; } .toplinks { gap:12px; } .main-head,.content { padding-left:18px; padding-right:18px; } }
        @media(max-width:650px) { .shell { grid-template-columns:56px minmax(0,1fr); } .side { grid-column:2; grid-row:1; border-bottom:1px solid var(--border); padding:13px; gap:8px; } .side h2 { font-size:16px; } .side-sub,.side-tip { display:none; } .channel-list { flex-direction:row; max-height:110px; } .channel { flex-shrink:0; } .side-empty { padding:9px; } .main { grid-column:2; grid-row:2; min-height:calc(100vh - 240px); } .rail { grid-column:1; grid-row:1 / span 2; } .toplinks a { font-size:12px; } .topbar { height:60px; } .main-head { align-items:flex-start; flex-wrap:wrap; } .composer { padding:10px; } .content { padding:18px 14px; } }

        .toolbar {display:flex;gap:9px;align-items:center;flex-wrap:wrap;padding:12px 24px;border-bottom:1px solid var(--border);background:#fffafd}
        .toolbar input {flex:1;min-width:130px;border:1px solid #ead1df;border-radius:10px;padding:10px 13px;background:white}
        .tool-button {border:1px solid #e8c4d5;background:#fff;color:#995475;border-radius:10px;padding:9px 12px;font-size:13px;font-weight:600}
        .tool-button:hover {background:#fce8f0}
        .channel-row {display:flex;align-items:center;gap:4px}
        .channel-row .channel {flex:1;min-width:0}
        .channel-options {border:0;background:transparent;color:#9d6984;padding:8px;border-radius:8px}
        .channel-options:hover {background:#f7dce7}
        .attachment-preview {display:flex;align-items:center;justify-content:space-between;gap:12px;margin:8px 24px;padding:10px 13px;background:#fff1f7;border:1px solid #eac7d8;border-radius:11px;font-size:12px}
        .attachment-pill {display:inline-flex;align-items:center;gap:5px;border-radius:8px;background:white;border:1px solid #efd9e3;padding:6px 9px;margin-top:8px;font-size:12px;color:#995475}
        .search-match {outline:2px solid #d46a92;outline-offset:2px}
        .muted-count {font-size:12px;color:#987c8b}
        .question-meta{font-size:12px;color:#9a8491;margin:8px 0 14px}
        .answer-panel{border-top:1px solid #f3dce7;margin-top:17px;padding-top:16px}
        .answer-card{background:#fff8fb;border:1px solid #f2dfe9;border-radius:12px;padding:14px;margin:10px 0}
        .answer-card.accepted{border-color:#d46a92;background:#fff1f7}
        .answer-card p,.reply-card p{white-space:pre-wrap;overflow-wrap:anywhere}
        .answer-actions{display:flex;gap:8px;flex-wrap:wrap;margin-top:10px}
        .answer-actions button,.question-actions button{border:1px solid #edcfde;border-radius:9px;background:#fff;color:#a14d78;padding:8px 11px}
        .answer-form{display:flex;flex-direction:column;gap:9px;margin-top:14px}
        .answer-form textarea{min-height:75px;width:100%;padding:11px;border:1px solid #e8cfdd;border-radius:10px;font:inherit;resize:vertical}
        .answer-form button{align-self:flex-end}
        .reply-card{margin:9px 0 0 16px;border-left:3px solid #e8bdd2;padding:6px 12px;background:white}
        .reply-card small,.answer-card small{color:#a35c83;font-weight:600}
        .question-actions{display:flex;gap:9px;flex-wrap:wrap;margin-top:12px}

.question-tools{display:flex;align-items:center;gap:12px;flex-wrap:wrap;margin:0 0 20px}
.question-tools input{flex:1;min-width:190px;max-width:420px}
.question-tools select{width:auto;min-width:120px}
.question-filter{display:flex;gap:6px;background:#fcebf3;padding:5px;border-radius:11px}
.question-filter button{border:0;background:transparent;color:#985d7d;border-radius:8px;padding:9px 13px;cursor:pointer}
.question-filter button.active{background:#d46a92;color:#fff}
.question-summary{display:flex;gap:22px;align-items:flex-start}
.question-stats{min-width:80px;display:flex;flex-direction:column;gap:9px;color:#8c7684;font-size:12px;padding-top:6px}
.question-info{min-width:0;flex:1}
.question-title{font-weight:700;font-size:17px;color:#b44e7d;background:none;border:0;text-align:left;cursor:pointer;padding:0}
.question-title:hover{text-decoration:underline}
.question-tags{display:flex;gap:6px;flex-wrap:wrap;margin:12px 0}
.question-tag{font-size:12px;background:#fce8f0;color:#a3537e;padding:5px 9px;border-radius:7px}
.accepted-indicator{color:#318265;font-size:12px;font-weight:700;display:inline-block;margin:8px 0}
.back-link{border:0;background:none;color:#b44e7d;font-weight:600;cursor:pointer;margin:0 0 15px;padding:5px 0}
.question-body{display:flex;gap:19px;margin-top:15px}
.vote-column{display:flex;flex-direction:column;align-items:center;gap:10px;min-width:38px}
.vote-button{border:1px solid #ebcfdd;border-radius:50%;background:#fff7fb;color:#b44e7d;width:35px;height:35px;cursor:pointer}
.question-copy{flex:1;min-width:0;overflow-wrap:anywhere;white-space:pre-wrap}
.question-comments{border-top:1px solid #f1dce7;margin-top:18px;padding-top:12px}
.comment-row{border-bottom:1px solid #f4e7ed;padding:10px 0;display:flex;gap:10px;align-items:center;flex-wrap:wrap;font-size:13px}
.comment-row span{flex:1;min-width:180px;overflow-wrap:anywhere}
.comment-row button{background:none;border:0;color:#a65c91;cursor:pointer}
.inline-compose{display:flex;gap:9px;margin-top:12px}
.inline-compose input{flex:1;min-width:0}
.answers-heading{margin:24px 0 12px}
.answer-form textarea{min-height:105px}
@media(max-width:680px){.question-summary{gap:10px}.question-stats{min-width:60px}.question-tools{align-items:stretch}.question-tools input{max-width:none;width:100%}.inline-compose{flex-wrap:wrap}}
        .shell { min-width: 0; }
        .main, .view, .content, .post-list { min-width: 0; }
        .toolbar { flex-wrap: wrap; }
        .toolbar input { flex: 1; min-width: 160px; }
        .post, .message { overflow-wrap: anywhere; }
        .modal { max-width: min(480px, calc(100vw - 30px)); }
        @media (max-width: 760px) {
            .shell { height: calc(100dvh - 65px); }
            .side { width: 175px; min-width: 175px; }
            .main-head { flex-wrap: wrap; gap: 10px; }
            .composer { flex-wrap: wrap; }
            .composer input[type=text] { min-width: 130px; }
        }
    
/* Question threads: compact discussions without a separate detail screen */
.question-tools{gap:10px}
.question-tools input{min-width:190px}
.thread-card{padding:24px 26px;margin-bottom:18px;max-width:100%}
.thread-header{display:flex;justify-content:space-between;align-items:flex-start;gap:16px}
.thread-heading{min-width:0;flex:1}
.thread-title{font-size:21px;line-height:1.35;margin:0;color:#34242f}
.thread-tools,.thread-actions{display:flex;gap:8px;flex-wrap:wrap}
.thread-tools button,.thread-actions button,.thread-reply-button{border:0;background:transparent;color:#a8527e;padding:5px 7px;font-size:13px;cursor:pointer}
.thread-body,.thread-answer-text{white-space:pre-wrap;overflow-wrap:anywhere;line-height:1.65;color:#564653}
.thread-body{margin:12px 0 22px}
.thread-divider{border-top:1px solid #f1dce7;margin:20px 0}
.thread-section-heading h4{font-size:16px;margin:0 0 16px}
.thread-empty{color:#927e8b;font-size:14px}
.thread-answer{background:#fff9fc;border:1px solid #f1dce7;border-radius:12px;padding:17px;margin:12px 0}
.thread-answer-text{margin:0 0 8px}
.thread-replies{margin:10px 0 10px 18px;border-left:2px solid #efd3e0}
.thread-reply{padding:10px 12px;margin:6px 0}
.thread-reply p,.thread-nested-reply p{margin:0 0 5px;white-space:pre-wrap;overflow-wrap:anywhere}
.thread-nested-reply{border-left:2px solid #edd3e1;margin:8px 0 0 14px;padding:7px 12px}
.thread-compose{margin-top:20px;border-top:1px solid #f1dce7;padding-top:18px}
.thread-compose h4{margin:0 0 12px}
.thread-compose textarea,.reply-compose textarea{display:block;width:100%;min-height:85px;border:1px solid #e8cfdd;border-radius:10px;padding:12px;font:inherit;resize:vertical;margin-bottom:10px}
.reply-compose{margin-top:10px}
.thread-compose>.primary,.reply-compose>.primary{margin-left:8px}
@media(max-width:680px){.thread-card{padding:17px}.thread-header{flex-direction:column}.thread-replies{margin-left:6px}}
.vote-active{background:#fce4ef!important;color:#a83d73!important;border-radius:7px;font-weight:700}.vote-score{display:inline-flex;align-items:center;font-weight:700;color:#34242f;padding:4px 3px}
/* Compact question listing */

/* Discord-inspired chat layout */
#chatView{min-height:0}
#chatRoom.chat-layout{display:flex;flex-direction:column;min-height:0;flex:1}
.discord-chat-top{display:flex;align-items:center;gap:12px;padding:12px 18px;border-bottom:1px solid #efd8e4;min-height:55px;background:#fffafd}
.chat-channel-label{font-size:16px;font-weight:750;white-space:nowrap}
.chat-channel-desc{font-size:12px;color:#947f8c;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;flex:1}
.chat-search-wrap{margin-left:auto;display:flex;align-items:center;gap:6px;background:#f9edf3;border:1px solid #ecd1df;border-radius:8px;padding:6px 9px;width:195px}
.chat-search-wrap input{background:transparent;border:0;outline:none;min-width:0;width:100%;font-size:12px}
.discord-chat-body{display:flex;flex:1;min-height:0}
.discord-chat-center{display:flex;flex:1;flex-direction:column;min-width:0;min-height:0}
.discord-members{width:210px;flex-shrink:0;background:#fff7fb;border-left:1px solid #efd8e4;padding:20px 14px}
.members-heading{font-size:11px;font-weight:800;letter-spacing:.08em;color:#a55b83;margin-bottom:16px}
.members-empty{font-size:12px;line-height:1.6;color:#98838f}
#chatRoom .chat-messages{display:block;flex:1;overflow-y:auto;padding:15px 0;min-height:180px}
#chatRoom .discord-message{display:flex;align-items:flex-start;gap:12px;max-width:none;width:100%;align-self:auto;background:transparent;border:0;border-radius:0;padding:10px 20px;margin:0}
#chatRoom .discord-message:hover{background:#fff4f9}
.discord-avatar{height:40px;width:40px;flex-shrink:0;border-radius:50%;display:flex;align-items:center;justify-content:center;background:#f4d9e7;color:#a55b83;font-size:23px}
.discord-message-content{min-width:0;flex:1}
.discord-message-meta{display:flex;align-items:baseline;gap:9px;margin-bottom:3px}
.discord-author{font-size:13px;font-weight:750;color:#a34d79}
.discord-timestamp{font-size:10px;color:#9d8995}
#chatRoom .discord-message p{margin:3px 0 5px;line-height:1.5;white-space:pre-wrap;overflow-wrap:anywhere}
.discord-reply-context{font-size:11px;color:#9b7d8e;border-left:2px solid #d46a92;padding-left:8px;margin:4px 0 7px}
.discord-message-actions{display:flex;align-items:center;gap:4px;opacity:.65}
.discord-message:hover .discord-message-actions{opacity:1}
.discord-message-actions button{font-size:11px;background:transparent;border:0;color:#a75b83;padding:4px 7px;cursor:pointer}
.discord-message-actions .post-actions{display:flex;gap:4px;margin:0}
#chatRoom .composer{margin:0 15px 15px;border:1px solid #eed4e2;border-radius:12px;background:#fff8fb;padding:9px;gap:9px}
#chatRoom .composer input[type=text]{background:transparent;border:0;outline:none;flex:1;min-width:0}
#chatRoom .attachment-preview{margin:5px 15px}
@media(max-width:1050px){.discord-members{width:155px}}
@media(max-width:850px){.discord-members{display:none}.chat-channel-desc{display:none}}
@media(max-width:560px){.discord-chat-top{padding:9px}.chat-search-wrap{width:125px}#chatRoom .discord-message{padding:9px}.discord-avatar{width:32px;height:32px}}
.discord-avatar{object-fit:cover;border-radius:50%;display:block}
.discord-member{display:flex;align-items:center;gap:10px;padding:10px 8px}
.discord-member .discord-avatar{width:32px;height:32px}
.discord-member-name{font-weight:600;color:#a34d79;font-size:13px}
#chatRoom{min-height:0}
#chatRoom .discord-chat-body{min-height:0}

#replyPreview{border-left:3px solid #d46a92}
#attachmentName{display:flex;align-items:center;gap:10px;min-width:0;overflow-wrap:anywhere}
.upload-thumbnail{width:56px;height:50px;object-fit:cover;border-radius:8px}
.chat-upload-image{display:block;max-width:min(380px,100%);max-height:320px;object-fit:contain;border-radius:12px;margin:8px 0;cursor:zoom-in}
.chat-upload-video{display:block;max-width:min(440px,100%);max-height:300px;border-radius:10px;margin:8px 0}
.chat-upload-audio{display:block;max-width:100%;margin:8px 0}

.badge-settings{margin:5px 0 12px;width:100%;font-size:12px}
.channel-invite{font-size:12px;white-space:nowrap;padding:7px 10px}
.role-badge,.custom-badge{display:inline-flex;align-items:center;white-space:nowrap;border-radius:6px;font-size:10px;font-weight:700;padding:3px 6px}
.role-badge{color:#a34c78;background:#f9dce9;border:1px solid #efbdd3}
.custom-badge{color:#77517c;background:#f5eafb;border:1px solid #e9d7ef}
.owner-name{color:#b64b86!important}
.profile-name{background:none;border:0;padding:0;cursor:pointer;font:inherit;text-align:left}
.profile-name:hover{text-decoration:underline}
.profile-clickable{cursor:pointer}
.profile-clickable:focus-visible{outline:3px solid #d46a92;outline-offset:3px}
.profile-popout{display:flex;gap:15px;align-items:center;padding:15px 0}
.profile-popout .discord-avatar{width:72px;height:72px}
.profile-details{display:flex;flex-direction:column;gap:8px}
.profile-details strong{font-size:18px}
.profile-badges{display:flex;flex-wrap:wrap;gap:6px}
.profile-link{display:inline-block;text-decoration:none;margin:8px 0 14px}
.discord-message-meta{display:flex;align-items:center;gap:7px;flex-wrap:wrap}
.discord-member{flex-wrap:nowrap;padding:7px 4px;gap:10px}.discord-member-name{flex:1;min-width:0;text-align:left;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}.profile-member-since{border-top:1px solid #edd7e2;margin-top:18px;padding-top:16px}
@media(max-width:900px){.channel-invite{font-size:11px;padding:6px}}
.student-profile-card{border:1px solid #f1c9d7;border-radius:16px;overflow:hidden;background:#fff}
.student-profile-banner{height:145px;background:#f5dbe7 center/cover no-repeat}
.student-profile-avatar{width:92px!important;height:92px!important;border:5px solid #fff!important;margin:-48px 0 0 20px;position:relative}
.student-profile-info{padding:14px 20px 24px}
.student-profile-name{margin:0 0 10px;font-size:22px}
.profile-section-title{font-size:12px;margin:20px 0 7px;color:#925b7a}
.profile-section-text{white-space:pre-wrap;overflow-wrap:anywhere;margin:0;line-height:1.5}
.student-profile-info .profile-link{display:inline-block;margin-top:22px}
</style>
</head>
<body>
<form id="form1" runat="server">
    <header class="topbar">
        <a class="brand" href="HomePage.aspx">Channels</a>
        <nav class="toplinks" aria-label="Website navigation">
            <a href="HomePage.aspx">Home</a>
            <a class="active" href="Channels.aspx">Channels</a>
            <a href="AccountSettings.aspx">Settings</a>
        </nav>
    </header>
    <div class="shell">
        <nav class="rail" aria-label="Sections">
            <button type="button" class="active" data-view="chat" title="Chat" aria-label="Chat">☏</button>
            <button type="button" data-view="announcements" title="Announcements" aria-label="Announcements">♧</button>
            <button type="button" class="rail-bottom" data-view="safety" title="Community safety" aria-label="Community safety">♢</button>
        </nav>
        <aside class="side">
            <div><h2 id="sideTitle">Channels</h2><p id="sideDescription" class="side-sub">Your space to connect and share.</p></div>
            <div id="channelSide">
                <div class="side-heading"><span>Your channels</span><button class="icon-add" type="button" onclick="openModal('channel')" title="Create channel" aria-label="Create channel">+</button></div>
                <div id="channelList" class="channel-list"></div>
            </div>
            
        </aside>
        <main class="main">
            <section class="view active" id="chatView">
                
                <div id="chatEmpty" class="chat-empty"><div class="center-empty"><div class="empty-symbol">✉</div><h2>Start your first channel</h2><p>Create a space for conversations, questions, and ideas. Your channels will appear in the sidebar.</p></div></div>
                <div id="chatRoom" class="chat-layout" style="display:none">
                    <div class="discord-chat-top"><span class="chat-channel-label" id="chatChannelLabel"># channel</span><span class="chat-channel-desc" id="chatChannelDescription"></span><button class="outline channel-invite" type="button" onclick="openInvites()">Invite Members</button><div class="chat-search-wrap"><span>⌕</span><input id="chatSearch" type="search" placeholder="Search messages" aria-label="Search messages" oninput="searchMessages()"/></div></div><div class="discord-chat-body"><div class="discord-chat-center">
                    <div id="messages" class="chat-messages"></div>
                    <div id="replyPreview" class="attachment-preview" style="display:none"><span id="replyName"></span><button class="tool-button" type="button" onclick="clearReply()">Cancel reply</button></div><div id="attachmentPreview" class="attachment-preview" style="display:none"><span id="attachmentName"></span><button class="tool-button" type="button" onclick="clearAttachment()">Remove</button></div>
                    <div class="composer"><input id="filePicker" type="file" hidden onchange="selectAttachment(this)"/><button class="tool-button" type="button" title="Attach file" onclick="document.getElementById('filePicker').click()">＋ Attach</button><input id="messageInput" type="text" maxlength="1000" placeholder="Write a message..." aria-label="Message" onkeydown="if(event.key==='Enter'){event.preventDefault();sendMessage();}"/><button class="primary" type="button" onclick="sendMessage()">Send</button></div></div><aside class="discord-members"><div class="members-heading">MEMBERS</div><div id="channelMembers" class="members-list"></div></aside></div>
                </div>
            </section>
            <section class="view" id="announcementsView">
                <div class="main-head"><div><h1>Announcements</h1><p>Updates and reminders shared by students.</p></div><button class="primary" type="button" onclick="openModal('announcement')">+ New Announcement</button></div>
                <div class="content"><div class="section-intro"><h2>Stay up to date</h2><p>Read announcements from other students and manage your own posts.</p></div><div id="announcementList" class="post-list"></div></div>
            </section>
            <section class="view" id="safetyView">
                <div class="main-head"><div><h1>Community Safety</h1><p>Helping keep conversations respectful.</p></div></div>
                <div class="content"><div class="section-intro"><h2>Reporting &amp; Moderation</h2><p>Use the Report option on a message or post to flag content for review.</p></div><div class="notice"><strong>Community guidelines</strong>Keep discussions respectful, stay on topic, and protect personal information.</div></div>
            </section>
        </main>
    </div>
    <div class="modal-backdrop" id="modalBackdrop" role="presentation" onclick="if(event.target===this)closeModal()">
        <div class="modal" role="dialog" aria-modal="true" aria-labelledby="modalTitle">
            <div class="modal-top"><h2 id="modalTitle">Create</h2><button type="button" class="close" onclick="closeModal()" aria-label="Close">×</button></div>
            <div id="modalFields"></div><p id="modalHint" class="field-hint" style="display:none"></p>
            <div class="modal-actions" id="modalActions"><button type="button" class="primary" id="modalSave" onclick="saveModal()">Create</button></div>
        </div>
    </div>
</form>
<script>
(function () {
    'use strict';
    const channels = [], announcements = [];

    let pendingAttachment = null;
    let replyTarget = null;
    let currentView = 'chat', selectedChannel = null, modalType = '';
    const byId = id => document.getElementById(id);
    const make = (tag, className, text) => { const el = document.createElement(tag); if(className)el.className=className; if(text!==undefined)el.textContent=text; return el; };
    function emptyNotice(title, detail) { const el=make('div','notice'); el.append(make('strong','',title),document.createTextNode(detail)); return el; }
    function showView(view) {
        currentView=view;
        document.querySelectorAll('.rail button[data-view]').forEach(b=>b.classList.toggle('active',b.dataset.view===view));
        document.querySelectorAll('.view').forEach(v=>v.classList.toggle('active',v.id===view+'View'));
        const titles={chat:'Channels',announcements:'Announcements',safety:'Community Safety'};
        byId('sideTitle').textContent=titles[view];
        byId('sideDescription').textContent=({chat:'Your space to connect and share.',announcements:'Updates and reminders.',safety:'Reporting and moderation.'})[view];
        byId('channelSide').style.display=view==='chat'?'block':'none';
        
        if(view==='announcements')renderAnnouncements();
    }
    document.querySelectorAll('.rail button[data-view]').forEach(b=>b.addEventListener('click',()=>showView(b.dataset.view)));
    function dialog(title, fields, primaryText, onSave, danger=false) {
        const area=byId('modalFields'); area.replaceChildren();
        byId('modalTitle').textContent=title;
        const controls={};
        fields.forEach(f=>{
            const wrap=field(f.label,f.id,f.multiline?'textarea':'text',f.placeholder||'',!f.optional);
            const input=wrap.querySelector('input,textarea');input.value=f.value||'';
            controls[f.id]=input;area.append(wrap);
        });
        const save=byId('modalSave');save.textContent=primaryText;
        save.classList.toggle('danger-action',danger);
        modalSaveAction=()=>{
            const values={};
            for(const f of fields){values[f.id]=controls[f.id].value.trim();if(!f.optional&&!values[f.id]){controls[f.id].focus();return;}}
            onSave(values);
        };
        byId('modalBackdrop').classList.add('open');
        const first=Object.values(controls)[0];if(first)first.focus();else save.focus();
    }
    let modalSaveAction=null;
    function editText(current,label,apply){dialog('Edit '+label,[{id:'text',label:label==='message'?'Message':'Text',value:current,multiline:true}], 'Save Changes',v=>{apply(v.text);closeModal();});}
    function deleteItem(list,item,label,refresh){confirmDelete('Delete '+label+'?','This action cannot be undone.',()=>{const index=list.indexOf(item);if(index>=0)list.splice(index,1);refresh();});}
    function confirmDelete(title,description,onDelete){
        const area=byId('modalFields');area.replaceChildren(make('p','confirm-copy',description));
        byId('modalTitle').textContent=title;
        const save=byId('modalSave');save.textContent='Delete';save.classList.add('danger-action');
        modalSaveAction=()=>{onDelete();closeModal();};
        byId('modalBackdrop').classList.add('open');save.focus();
    }
    function noticeDialog(title,description){
        const area=byId('modalFields');area.replaceChildren(make('p','confirm-copy',description));
        byId('modalTitle').textContent=title;
        const save=byId('modalSave');save.textContent='Close';save.classList.remove('danger-action');
        modalSaveAction=()=>closeModal();byId('modalBackdrop').classList.add('open');
    }
    function reportContent(){dialog('Report Content',[{id:'reason',label:'Reason',multiline:true,placeholder:'Describe the issue'}],'Submit Report',()=>{closeModal();});}
    function manageButtons(container, edit, remove) {
        const actions = make('div', 'post-actions');
        const editButton = make('button', '', '✎ Edit');
        editButton.type = 'button'; editButton.onclick = edit;
        const deleteButton = make('button', '', '🗑 Delete');
        deleteButton.type = 'button'; deleteButton.onclick = remove;
        actions.append(editButton, deleteButton);
        container.append(actions);
    }
    function renderChannels() {
        const list=byId('channelList'); list.replaceChildren();
        if(!channels.length){const el=make('div','side-empty');el.append(make('span','big','#'),document.createTextNode('No channels yet'));list.append(el);}
        channels.forEach(c=>{const row=make('div','channel-row');const b=make('button','channel'+(selectedChannel===c.id?' selected':''),'# '+c.name);b.type='button';b.onclick=()=>{selectedChannel=c.id;clearAttachment();byId('chatSearch').value='';renderChannels();showView('chat');};const menu=make('button','channel-options','⋯');menu.type='button';menu.title='Channel options';menu.onclick=()=>{selectedChannel=c.id;renderChannels();openChannelSettings();};row.append(b,menu);list.append(row);});
        renderChat();
    }
    const signedInUser = {
        username: '<%= HttpUtility.JavaScriptStringEncode(ChatUsername) %>',
        avatarUrl: '<%= HttpUtility.JavaScriptStringEncode(ChatAvatarUrl) %>',
        bannerUrl: '<%= HttpUtility.JavaScriptStringEncode(ChatBannerUrl) %>',
        major: '<%= HttpUtility.JavaScriptStringEncode(ChatMajor) %>',
        year: '<%= HttpUtility.JavaScriptStringEncode(ChatYear) %>',
        bio: '<%= HttpUtility.JavaScriptStringEncode(ChatBio) %>',
        status: '<%= HttpUtility.JavaScriptStringEncode(ChatStatus) %>',
        memberSince: '<%= HttpUtility.JavaScriptStringEncode(ChatMemberSince) %>'
    };
    function profileAvatar() {
        const img = make('img','discord-avatar','');
        img.src = signedInUser.avatarUrl;
        img.alt = signedInUser.username + ' profile picture';
        img.loading = 'lazy';
        img.onerror = function () {
            this.onerror = null;
            this.src = '<%= HttpUtility.JavaScriptStringEncode(ResolveUrl("~/Images/default-avatar.png")) %>';
        };
        return img;
    }
    function addBadges(parent, owner) {
        if(owner){const role=make('span','role-badge','♛ Owner');role.title='Channel creator';parent.append(role);}
        if(signedInUser.major)parent.append(make('span','custom-badge','🎓 '+signedInUser.major));
        if(signedInUser.year)parent.append(make('span','custom-badge','📚 '+signedInUser.year));
    }
    function openProfile() {
        const c=channels.find(x=>x.id===selectedChannel);
        const area=byId('modalFields');area.replaceChildren();
        byId('modalTitle').textContent='Student Profile';
        byId('modalActions').style.display='none';
        const card=make('div','student-profile-card');
        const banner=make('div','student-profile-banner');
        if(signedInUser.bannerUrl)banner.style.backgroundImage='url("'+signedInUser.bannerUrl.replace(/"/g,'%22')+'")';
        card.append(banner);
        const avatar=profileAvatar();avatar.classList.add('student-profile-avatar');card.append(avatar);
        const info=make('div','student-profile-info');
        info.append(make('h2','student-profile-name',signedInUser.username));
        const badges=make('div','profile-badges');addBadges(badges,!!c&&c.owner===signedInUser.username);
        info.append(badges);
        const memberSince=make('div','profile-member-since');
        memberSince.append(make('h4','profile-section-title','MEMBER SINCE'));
        memberSince.append(make('p','profile-section-text',signedInUser.memberSince||'Date unavailable'));
        info.append(memberSince);
        if(signedInUser.status){
            info.append(make('h4','profile-section-title','STATUS'));
            info.append(make('p','profile-section-text',signedInUser.status));
        }
        if(signedInUser.bio){
            info.append(make('h4','profile-section-title','ABOUT ME'));
            info.append(make('p','profile-section-text',signedInUser.bio));
        }
        card.append(info);area.append(card);
        modalSaveAction=null;byId('modalBackdrop').classList.add('open');
    }
    window.openInvites=function(){
        noticeDialog('Invite Members','Channel invitations need saved channel memberships and a database-backed invitation system. This button will be connected when channels are saved to SQL Server.');
        byId('modalActions').style.display='none';
    };
    function renderChat() {
        const c=channels.find(x=>x.id===selectedChannel);
        byId('chatEmpty').style.display=c?'none':'flex';byId('chatRoom').style.display=c?'flex':'none';
        if(!c)return;
        byId('chatChannelLabel').textContent='# '+c.name;
        byId('chatChannelDescription').textContent=c.description||'';
        const box=byId('messages');box.replaceChildren();
        if(!c.messages.length)box.append(emptyNotice('No messages yet','Start the conversation.'));
        c.messages.forEach((m,index)=>{
            if(typeof m==='string'){m={text:m,file:null};c.messages[index]=m;}
            const item=make('div','discord-message message');
            const avatar=profileAvatar();
            avatar.classList.add('profile-clickable');
            avatar.setAttribute('role','button');
            avatar.setAttribute('tabindex','0');
            avatar.title='View profile';
            avatar.onclick=openProfile;
            avatar.onkeydown=function(event){if(event.key==='Enter'||event.key===' '){event.preventDefault();openProfile();}};
            const content=make('div','discord-message-content');
            const meta=make('div','discord-message-meta');
            const author=make('span','discord-author',signedInUser.username);
            if(c.owner===signedInUser.username)author.classList.add('owner-name');
            meta.append(author);addBadges(meta,c.owner===signedInUser.username);
            if(!m.time)m.time=new Date().toLocaleTimeString([],{hour:'numeric',minute:'2-digit'});
            meta.append(make('span','discord-timestamp',m.time));
            content.append(meta);
            if(m.replyTo)content.append(make('div','discord-reply-context','↳ '+m.replyTo));
            if(m.text)content.append(make('p','',m.text));
            if(m.file){
                const file=m.file;
                if(file.type && file.type.startsWith('image/') && file.url){
                    const photo=make('img','chat-upload-image','');
                    photo.src=file.url;photo.alt=file.name;
                    photo.onclick=()=>window.open(file.url,'_blank','noopener,noreferrer');
                    content.append(photo);
                }else if(file.type && file.type.startsWith('video/') && file.url){
                    const video=make('video','chat-upload-video','');video.controls=true;video.src=file.url;content.append(video);
                }else if(file.type && file.type.startsWith('audio/') && file.url){
                    const audio=make('audio','chat-upload-audio','');audio.controls=true;audio.src=file.url;content.append(audio);
                }else{
                    const link=make('a','attachment-pill','📎 '+(file.name||file));
                    if(file.url){link.href=file.url;link.download=file.name;}
                    content.append(link);
                }
            }
            const actions=make('div','discord-message-actions');
            const reply=make('button','','Reply');reply.type='button';reply.onclick=()=>{
                replyTarget={id:m.id,summary:(m.text||(m.file&&(m.file.name||m.file))||'Attachment').slice(0,90)};
                byId('replyName').textContent='Replying to '+signedInUser.username+': '+replyTarget.summary;
                byId('replyPreview').style.display='flex';
                byId('messageInput').focus();
            };
            actions.append(reply);
            manageButtons(actions,()=>editText(m.text,'message',value=>{m.text=value;renderChat();}),()=>deleteItem(c.messages,m,'message',renderChat));
            content.append(actions);item.append(avatar,content);box.append(item);
        });
        const members=byId('channelMembers');members.replaceChildren();
        const memberRow=make('div','discord-member');
        const memberAvatar=profileAvatar();
        const memberName=make('span','discord-member-name',signedInUser.username);
        if(c.owner===signedInUser.username)memberName.classList.add('owner-name');
        memberRow.append(memberAvatar,memberName);
        members.append(memberRow);
        searchMessages();box.scrollTop=box.scrollHeight;
    }
    window.sendMessage=function(){
        const c=channels.find(x=>x.id===selectedChannel),input=byId('messageInput');
        if(!c||(!input.value.trim()&&!pendingAttachment))return;
        c.messages.push({
            id:Date.now()+Math.random(),
            text:input.value.trim(),
            file:pendingAttachment,
            replyTo:replyTarget?replyTarget.summary:'',
            time:new Date().toLocaleTimeString([],{hour:'numeric',minute:'2-digit'})
        });
        input.value='';
        pendingAttachment=null;
        byId('filePicker').value='';
        byId('attachmentPreview').style.display='none';
        clearReply();
        renderChat();input.focus();
    };
    window.selectAttachment=function(input){
        const file=input.files&&input.files[0];if(!file)return;
        if(pendingAttachment&&pendingAttachment.url)URL.revokeObjectURL(pendingAttachment.url);
        pendingAttachment={name:file.name,type:file.type,url:URL.createObjectURL(file)};
        const preview=byId('attachmentPreview');preview.style.display='flex';
        const label=byId('attachmentName');label.replaceChildren();
        if(file.type.startsWith('image/')){
            const thumb=make('img','upload-thumbnail','');
            thumb.src=pendingAttachment.url;thumb.alt=file.name;label.append(thumb);
        }
        label.append(document.createTextNode(file.name));
    };
    window.clearAttachment=function(){
        if(pendingAttachment&&pendingAttachment.url)URL.revokeObjectURL(pendingAttachment.url);
        pendingAttachment=null;byId('filePicker').value='';
        byId('attachmentPreview').style.display='none';
    };
    window.clearReply=function(){
        replyTarget=null;
        byId('replyPreview').style.display='none';
        byId('replyName').textContent='';
    };
    window.searchMessages=function(){const query=byId('chatSearch').value.trim().toLowerCase();const nodes=byId('messages').querySelectorAll('.message');nodes.forEach(node=>{const match=!query||node.textContent.toLowerCase().includes(query);node.style.display=match?'':'none';node.classList.toggle('search-match',!!query&&match);});};
    window.deleteChannel=function(){const c=channels.find(x=>x.id===selectedChannel);if(!c)return;confirmDelete('Delete #'+c.name+'?','All messages in this channel will be deleted.',()=>{channels.splice(channels.indexOf(c),1);selectedChannel=null;clearAttachment();byId('chatSearch').value='';renderChannels();});};
    window.openChannelSettings=function(){const c=channels.find(x=>x.id===selectedChannel);if(!c)return;
        dialog('Channel Settings',[{id:'name',label:'Channel name',value:c.name},{id:'description',label:'Description',value:c.description||'',multiline:true,optional:true}], 'Save Changes',v=>{c.name=v.name.replace(/^#+/,'').trim();if(!c.name)return;c.description=v.description;renderChannels();closeModal();}); const footer=byId('modalFields'); const deleteButton=make('button','outline','Delete Channel');deleteButton.type='button';deleteButton.style.marginTop='12px';deleteButton.style.color='#ae375e';deleteButton.onclick=()=>window.deleteChannel();footer.append(deleteButton);
    };
    function renderAnnouncements(){
        const box=byId('announcementList');box.replaceChildren();
        const visible=announcements.filter(a=>!a.dismissed);
        if(!visible.length){box.append(emptyNotice('No announcements yet','Announcements students create will appear here.'));return;}
        visible.forEach(a=>{
            const own=a.isOwn !== false;
            const card=make('article','post'+(a.completed?' completed':''));
            card.append(make('h3','',a.title),make('p','',a.body));
            if(own){
                manageButtons(card,()=>editPost(a,renderAnnouncements),()=>deleteItem(announcements,a,'announcement',renderAnnouncements));
            }else{
                const actions=make('div','post-actions');
                const done=make('button','',a.completed?'↶ Mark Incomplete':'✓ Mark Complete');
                done.type='button';done.onclick=()=>{a.completed=!a.completed;renderAnnouncements();};
                const dismiss=make('button','','Dismiss');dismiss.type='button';dismiss.onclick=()=>{a.dismissed=true;renderAnnouncements();};
                const report=make('button','','Report');report.type='button';report.onclick=reportContent;
                actions.append(done,dismiss,report);card.append(actions);
            }
            box.append(card);
        });
    }
    function editPost(post,refresh){dialog('Edit Post',[{id:'title',label:'Title',value:post.title},{id:'body',label:'Details',value:post.body,multiline:true}], 'Save Changes',v=>{post.title=v.title;post.body=v.body;refresh();closeModal();});}
    function reportPreview(){reportContent();}
    function action(parent,label,callback,css='') {const b=make('button',css,label);b.type='button';b.onclick=callback;parent.append(b);return b;}
    function field(label,id,kind,placeholder,required=true){const wrap=make('label','field');wrap.append(make('span','',label));let el;if(kind==='textarea')el=make('textarea');else if(kind==='select')el=make('select');else{el=make('input');el.type=kind||'text';}el.id=id;el.placeholder=placeholder||'';el.required=required;if(kind==='text')el.maxLength=100;wrap.append(el);return wrap;}
    window.openModal=function(type){byId('modalActions').style.display='flex';modalType=type;modalSaveAction=null;byId('modalSave').textContent='Create';byId('modalSave').classList.remove('danger-action');const area=byId('modalFields');area.replaceChildren();byId('modalTitle').textContent=({channel:'Create a Channel',announcement:'New Announcement'})[type];if(type==='channel'){area.append(field('Channel name','formTitle','text','Enter channel name'),field('Description (optional)','formBody','textarea','What is this channel for?',false));}else if(type==='announcement'){area.append(field('Announcement title','formTitle','text','Enter a title'),field('Announcement details','formBody','textarea','Write your announcement'));}byId('modalBackdrop').classList.add('open');setTimeout(()=>byId('formTitle').focus(),0);};
    window.closeModal=function(){
        byId('modalActions').style.display='flex';byId('modalBackdrop').classList.remove('open');modalSaveAction=null;};
    window.saveModal=function(){if(modalSaveAction){modalSaveAction();return;}const title=byId('formTitle').value.trim(),body=byId('formBody').value.trim();if(!title){byId('formTitle').focus();return;}if(modalType!=='channel'&&!body){byId('formBody').focus();return;}if(modalType==='channel'){const name=title.replace(/^#+/,'').trim();if(!name){byId('formTitle').focus();return;}const c={id:Date.now()+Math.random(),name,description:body,messages:[],owner:signedInUser.username};channels.push(c);selectedChannel=c.id;renderChannels();showView('chat');}else if(modalType==='announcement'){announcements.unshift({title,body,isOwn:true,completed:false,dismissed:false});showView('announcements');}closeModal();};
    document.addEventListener('keydown',e=>{if(e.key==='Escape')closeModal();});
    renderChannels();renderAnnouncements();
})();
</script>
</body>
</html>
