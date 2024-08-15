*** Settings ***
Documentation    This file contains the jsonpath for the create and get user/users response 


*** Variables ***
${CREATE_USER_NAME_JSONPATH}         $.name
${CREATE_USER_JOB_JSONPATH}          $.job
${CREATE_USER_ID_JSONPATH}           $.id
${CREATE_USER_CREATEDAT_JSONPATH}    $.createdAt

${GET_USERS_PAGE}           $.page
${GET_USERS_PER_PAGE}       $.per_page
${GET_USERS_TOTAL}          $.total
${GET_USERS_TOTAL_PAGES}    $.total_pages
${GET_USERS_DATA}           $.data

${GET_USER_BY_ID_ID_JSONPATH}              $.data.id
${GET_USER_BY_ID_EMAIL_JSONPATH}           $.data.email
${GET_USER_BY_ID_FIRST_NAME_JSONPATH}      $.data.first_name
${GET_USER_BY_ID_LAST_NAME_JSONPATH}       $.data.last_name
${GET_USER_BY_ID_AVATAR_JSONPATH}          $.data.avatar
${GET_USER_BY_ID_SUPPORT_URL_JSONPATH}     $.support.url
${GET_USER_BY_ID_SUPPORT_TEXT_JSONPATH}    $.support.text
